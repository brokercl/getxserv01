import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/entities/course.dart';
import 'package:gtxserv01/services/user/auth_service.dart';
import 'package:gtxserv01/services/course/course_service.dart';
import 'package:gtxserv01/utils.dart';

class CourseForm extends StatelessWidget {
  final courseService = Get.find<CourseService>(); // Instantiate the controller
  final authService = Get.find<AuthService>();
  final curseFormKey = GlobalKey<FormState>();
  final String buttonTitle;
  final Course selectedCourse;

  CourseForm(
      {super.key, required this.buttonTitle, required this.selectedCourse});

  @override
  Widget build(BuildContext context) {
    final courseIdController = TextEditingController(
        text: buttonTitle == StringActionFormButton.update.name
            ? selectedCourse.id.toString()
            : null);

    final courseCost = TextEditingController(
        text: buttonTitle == StringActionFormButton.update.name
            ? selectedCourse.id.toString()
            : null);

    bool atLeastOneFormFieldHasChanged = false;

    TopicCourse courseTopicsValue = selectedCourse.topic;

    StatusCourse courseStatusValue = selectedCourse.status;
    ModalClass modalClass = ModalClass.mixClass;
    setEnabledBooleansByRol();
    return Form(
      key: curseFormKey,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            enabled: enableIdTextEditing,
            controller: courseIdController,
            keyboardType: TextInputType.number,
            inputFormatters: [LengthLimitingTextInputFormatter(12)],
            decoration: const InputDecoration(labelText: 'Id'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid course Id';
              }
              return null;
            },
            onChanged: (value) => atLeastOneFormFieldHasChanged = true,
          ),
          DropdownButtonFormField<TopicCourse>(
            value: courseTopicsValue,
            items: TopicCourse.values
                .map((topics) => DropdownMenuItem(
                      value: topics,
                      child: Text(topics.name),
                    ))
                .toList(),

            onChanged: (newUserTopic) {
              atLeastOneFormFieldHasChanged = true;
              courseTopicsValue = newUserTopic!;
            }, // save only changed fields..
            decoration: const InputDecoration(
              labelText: 'Topics',
            ),
          ),
          DropdownButtonFormField<StatusCourse>(
            value: courseStatusValue,
            items: StatusCourse.values
                .map((status) => DropdownMenuItem(
                      value: status,
                      child: Text(status.name),
                    ))
                .toList(),
            onChanged: (newCourseStatus) {
              courseStatusValue = newCourseStatus!;
              atLeastOneFormFieldHasChanged = true;
            }, // save only changed fields..
            decoration: const InputDecoration(
              labelText: 'Status',
            ),
          ),
          DropdownButtonFormField<ModalClass>(
            value: modalClass,
            items: ModalClass.values
                .map((modal) => DropdownMenuItem(
                      value: modal,
                      child: Text(modal.name),
                    ))
                .toList(),
            onChanged: (newModalClass) {
              modalClass = newModalClass!;
              atLeastOneFormFieldHasChanged = true;
            }, // save only changed fields..
            decoration: const InputDecoration(
              labelText: 'Status',
            ),
          ),
          TextFormField(
            enabled: enableCourseCostTextEditing,
            controller: courseCost,
            keyboardType: TextInputType.number,
            inputFormatters: [LengthLimitingTextInputFormatter(12)],
            decoration: const InputDecoration(labelText: 'Course Cost'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter valid course Cost';
              }
              return null;
            },
            onChanged: (value) => atLeastOneFormFieldHasChanged = true,
          ),
          Obx(() => // Obx widget to update UI when cuotas value changes
              Text('Cuotas: ${courseService.cuotas.value}')),
          Obx(
            () => Slider(
              value: courseService.cuotas.value.toDouble(),
              min: 1,
              max: 12,
              onChanged: (value) => courseService.updateCuotas(value.toInt()),
            ),
          ),
          const SizedBox(height: 6.0),
          Obx(
            () => Column(
              children: [
                Text(
                  'Schedule Class: ${getScheduleClassName(courseService.selectedSchedule.value)}',
                  style: const TextStyle(fontSize: 18.0),
                ),
                Slider(
                  value: courseService.selectedSchedule.value.index.toDouble(),
                  min: 0,
                  max: ScheduleClass.values.length - 1.toDouble(),
                  onChanged: (value) {
                    courseService.selectedSchedule.value =
                        ScheduleClass.values[value.toInt()];
                  },
                  divisions: ScheduleClass.values.length - 1,
                  label: getScheduleClassName(
                      courseService.selectedSchedule.value),
                ),
              ],
            ),
          ),
          const SizedBox(height: 3.0),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 11, 101, 14)),
                onPressed: () {
                  if (curseFormKey.currentState!.validate()) {
                    if (!atLeastOneFormFieldHasChanged) {
                      Get.snackbar(' failed to $buttonTitle course',
                          'change at least one field to proceed..',
                          snackPosition: SnackPosition.BOTTOM);
                    } else {
                      courseService
                          .createUpdateCourse(
                              buttonTitle,
                              Course(
                                  id: int.tryParse(courseIdController.text),
                                  topic: courseTopicsValue,
                                  status: courseStatusValue,
                                  modalClass: ModalClass.mixClass,
                                  numCuotas: 12,
                                  coursecost: int.parse(courseCost.text),
                                  scheduleClass: ScheduleClass.day))
                          .then((ResponseCourseService responseService) {
                        responseService = responseService;
                        if (responseService.createUpdateResult) {
                          Get.back();
                        }
                        Get.snackbar(
                          backgroundColor: responseService.returnMessageColor,
                          snackPosition: SnackPosition.BOTTOM,
                          responseService.returnMessage,
                          "..",
                        );
                      });
                    }
                  }
                },
                child: Text(
                  buttonTitle,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              IconButton(
                  color: const Color.fromARGB(255, 181, 73, 66),
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.cancel)),
              IconButton(
                  color: const Color.fromARGB(255, 83, 84, 171),
                  onPressed: () {
                    curseFormKey.currentState!.reset();
                  },
                  icon: const Icon(Icons.reset_tv_sharp)),
            ],
          ),
        ],
      ),
    );
  }
}
