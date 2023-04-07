import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/entities/course.dart';
import 'package:gtxserv01/forms/course_form.dart';
import 'package:gtxserv01/forms/add_update_user_form.dart';
import 'package:gtxserv01/entities/user.dart';
import 'package:gtxserv01/services/course/course_service.dart';
import 'package:gtxserv01/services/user/auth_service.dart';
import 'package:gtxserv01/ui/courses_list.dart';
import 'package:gtxserv01/ui/payment_table.dart';
import 'package:gtxserv01/ui/users_list.dart';

import '../utils.dart';

User? get currentUser => Get.find<AuthService>().currentUser;

final courseService = Get.find<CourseService>();

class ManagerBottom extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  ManagerBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.amber,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Obx(
            (() => SizedBox(
                  width: withSizedBoxBottom,
                  child: addUserBottom[0]
                      ? IconButton(
                          color: const Color.fromARGB(255, 33, 63, 184),
                          onPressed: () =>
                              // i is the index used in both forms, create and update
                              // and its a necesary parameter required by its constructor
                              //but in this form, that is used to create a new user is useless
                              Get.defaultDialog(
                                  title:
                                      '${authService.currentUser!.role.name} ${StringActionFormButton.create.name}',
                                  content: AddUpdateUserForm(
                                    key: formKey,
                                    buttonTitle:
                                        StringActionFormButton.create.name,
                                    selectedUser: User(
                                        id: 0,
                                        email: '',
                                        password: '',
                                        status: StatusUser.pending,
                                        role: Rol.student),
                                  )),
                          tooltip: addUserBottom[1],
                          icon: Image.asset('images/add_user.png'),
                        )
                      : Image.asset(
                          'images/add_user.png',
                          scale: 12,
                          color: addUserBottom[0]
                              ? null
                              : Colors.white.withOpacity(0.3),
                          colorBlendMode: BlendMode.dstIn,
                        ),
                )),
          ),
          Obx(
            (() => SizedBox(
                  width: withSizedBoxBottom,
                  child: addCourseBottom[0]
                      ? IconButton(
                          color: const Color.fromARGB(255, 33, 63, 184),
                          onPressed: () =>
                              // i is the index used in both forms, create and update
                              // and its a necesary parameter required by its constructor
                              //but in this form, that is used to create a new user is useless
                              Get.defaultDialog(
                                  title:
                                      '${authService.currentUser!.role.name} ${StringActionFormButton.create.name}',
                                  content: CourseForm(
                                    key: formKey,
                                    buttonTitle:
                                        StringActionFormButton.create.name,
                                    selectedCourse: Course(
                                        id: 0,
                                        topic: TopicCourse.dart,
                                        status: StatusCourse.pending,
                                        modalClass: ModalClass.mixClass,
                                        coursecost: 0,
                                        numCuotas: 12,
                                        scheduleClass: ScheduleClass.day),
                                  )),
                          tooltip: addCourseBottom[1],
                          icon: Image.asset('images/add_course.png'),
                        )
                      : Image.asset(
                          'images/add_course.png',
                          scale: 12,
                          color: addCourseBottom[0]
                              ? null
                              : Colors.white.withOpacity(0.3),
                          colorBlendMode: BlendMode.dstIn,
                        ),
                )),
          ),
          Obx(
            (() => SizedBox(
                width: withSizedBoxBottom,
                child: IconButton(
                  color: const Color.fromARGB(255, 33, 63, 184),
                  onPressed: () {
                    addUserBottom[0] = true;
                    addCourseBottom[0] = false;
                    Get.to(() => UserList());
                  },
                  tooltip: listUsersBottom[1],
                  icon: Image.asset('images/users.png'),
                ))),
          ),
          Obx(
            (() => SizedBox(
                width: withSizedBoxBottom,
                child: IconButton(
                  color: const Color.fromARGB(255, 33, 63, 184),
                  onPressed: () {
                    addUserBottom[0] = false;
                    addCourseBottom[0] = true;
                    Get.to(() => CourseList(currentUser!));
                  },
                  tooltip: listCoursesBottom[1],
                  icon: Image.asset('images/list_courses.png'),
                ))),
          ),
          SizedBox(
              width: withSizedBoxBottom,
              child: IconButton(
                color: const Color.fromARGB(255, 33, 63, 184),
                onPressed: () {
                  addUserBottom[0] = false;
                  addCourseBottom[0] = false;

                  Get.to(() => const PaymentsTable(
                        payments: [],
                      ));
                },
                tooltip: paymentsBottom[1],
                icon: Image.asset('images/debit-card.png'),
              )),
        ],
      ),
    );
  }
}
