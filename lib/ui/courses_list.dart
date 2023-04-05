import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/entities/course.dart';
import 'package:gtxserv01/forms/course_form.dart';
import 'package:gtxserv01/entities/user.dart';
import 'package:gtxserv01/services/user/auth_service.dart';
import 'package:gtxserv01/services/course/course_service.dart';
import 'package:gtxserv01/ui/manager_bottom.dart';
import 'package:gtxserv01/ui/student_bottom.dart';
import 'package:gtxserv01/utils.dart';

User? get currentUser => Get.find<AuthService>().currentUser;

class CourseList extends GetView<CourseService> {
  final courseService = Get.find<CourseService>();
  final TextEditingController textEditingController = TextEditingController();

  CourseList(User currentUser, {super.key});

  @override
  Widget build(BuildContext context) {
    TopicCourse topicCourse = TopicCourse.programming;
    StatusCourse statusCourse = StatusCourse.pending;
    Rx<FindByCourseField> findByCourseField = FindByCourseField.topic.obs;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              highlightColor: Colors.blue,
              tooltip: 'logout',
              onPressed: () => AuthService().signOut(),
              icon: const Icon(Icons.logout)),
          title: InkWell(
            child: Image.asset(
              // the name of the image correspond to the user Role
              // admin, manager, tutor, teacher, student..
              'images/${currentUser!.role.name}.png',
              scale: 9.0,
            ),
            onTap: () => Get.defaultDialog(
                title: 'email ${currentUser!.email}',
                content: Text(
                    'role ${currentUser!.role.name} \n status ${currentUser!.status.name}'),
                confirm: InkWell(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      'images/${currentUser!.role.name}.png',
                      scale: 9.0,
                    ))),
          ),
          actions: [
            Row(
              children: [
                SizedBox(
                  width: 120.0,
                  // presenta opciones a busar por user field, id, email, role, status
                  child: DropdownButtonFormField<FindByCourseField>(
                    value: findByCourseField.value,
                    items: FindByCourseField.values
                        .map((fields) => DropdownMenuItem(
                              value: fields,
                              child: Text(fields.name),
                            ))
                        .toList(),
                    onChanged: (newFindByField) {
                      textEditingController.clear();
                      findByCourseField.value = newFindByField!;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Field',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Obx(
                    (() => SizedBox(
                          width: 125.0,
                          child: findByCourseField.value ==
                                  FindByCourseField.topic
                              ? DropdownButtonFormField(
                                  value: topicCourse,
                                  items: TopicCourse.values
                                      .map((topics) => DropdownMenuItem(
                                            value: topics,
                                            child: Text(topics.name),
                                          ))
                                      .toList(),
                                  onChanged: (newTopicCourse) {
                                    topicCourse = newTopicCourse!;
                                    courseService.findCourses(
                                        findByCourseField.value,
                                        null,
                                        newTopicCourse,
                                        null);
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Topics',
                                  ),
                                )
                              : findByCourseField.value ==
                                      FindByCourseField.status
                                  ? DropdownButtonFormField(
                                      value: statusCourse,
                                      items: StatusCourse.values
                                          .map((status) => DropdownMenuItem(
                                                value: status,
                                                child: Text(
                                                    status.name.toString()),
                                              ))
                                          .toList(),
                                      onChanged: (newCourseStatus) {
                                        statusCourse = newCourseStatus!;
                                        courseService.findCourses(
                                            findByCourseField.value,
                                            null,
                                            null,
                                            newCourseStatus);
                                      },
                                      decoration: const InputDecoration(
                                        labelText: 'Status',
                                      ),
                                    )
                                  : TextField(
                                      controller: textEditingController,
                                      decoration: const InputDecoration(
                                        hintText: 'Search',
                                      ),
                                      onSubmitted: (notUsed) => courseService
                                          .findCourses(
                                              findByCourseField.value,
                                              int.tryParse(
                                                  textEditingController.text),
                                              topicCourse,
                                              statusCourse)
                                          .then((courses) => listCourses(
                                              controller, courses))),
                        )),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => courseService
                        .findCourses(
                            findByCourseField.value,
                            int.tryParse(textEditingController.text),
                            topicCourse,
                            statusCourse)
                        .then((courses) => listCourses(controller, courses))),
              ],
            ),
          ],
        ),
        body: controller.obx(
          (courses) => listCourses(controller, courses),
          onLoading: const Center(child: CircularProgressIndicator()),
          onEmpty: const Text('No courses founded..'),
          onError: (error) => Text(controller.state.toString()),
        ),
        bottomNavigationBar: currentUser!.role == Rol.admin ||
                currentUser!.role == Rol.manager
            // Rol.admin && Rol.manager use same forms diferrence in status and rols
            ? ManagerBottom()
            : StudentBottom());
  }
}

listCourses(CourseService courseService, List<Course>? courses) {
  return Obx((() => ListView.builder(
      itemCount: courses!.length,
      itemBuilder: (context, i) {
        final course = courses[i];
        return Container(
          color: setDialogBackgroundColorByCourseStatus(courses[i].status),
          child: Dismissible(
            key: Key(course.id.toString()),
            direction: DismissDirection.startToEnd,
            background: Container(
              color: Colors.red,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            onDismissed: (direction) {
              courseService.fisicDdeleteCourseFromDDBB(courses[i]);
              Get.snackbar(
                snackPosition: SnackPosition.BOTTOM,
                "Course ${courses[i].topic} eliminado..",
                "..",
              );
            },
            child: GestureDetector(
              onTap: () => Get.defaultDialog(
                backgroundColor:
                    setDialogBackgroundColorByCourseStatus(courses[i].status),
                title:
                    '${currentUser!.role} ${StringActionFormButton.update.name}',
                content: CourseForm(
                  buttonTitle: StringActionFormButton.update.name,

                  /// es de vital importancia tener en cuenta que
                  /// user_form.dart se comportara dependiendo del
                  /// valor enum StringActionFormButton {
                  ///  create,
                  ///  update,
                  ///  }

                  selectedCourse: courses[i],
                ),
              ),
              child: ListTile(
                title: Text(courses[i].topic.name),
                subtitle: Text('id ${courses[i].id!.toString()}'),
                trailing: Column(
                  children: [
                    Text(courses[i].status.name.toString()),
                  ],
                ),
              ),
            ),
          ),
        );
      })));
}
