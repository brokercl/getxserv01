import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/entities/course.dart';
import 'package:gtxserv01/forms/course_form.dart';
import 'package:gtxserv01/forms/add_update_user_form.dart';
import 'package:gtxserv01/entities/user.dart';
import 'package:gtxserv01/services/course/course_service.dart';
import 'package:gtxserv01/services/user/auth_service.dart';
import 'package:gtxserv01/ui/courses_list.dart';
import 'package:gtxserv01/ui/users_list.dart';

import '../utils.dart';

User? get currentUser => Get.find<AuthService>().currentUser;

final courseService = Get.find<CourseService>();

class ManagerBottom extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  ManagerBottom({super.key});

  @override
  Widget build(BuildContext context) {
    double spaceBetweenBottomMenuItems =
        400 / managerBottomCases.length; // width / No menu items
    return Container(
      height: 60,
      color: Colors.amber,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
              width: spaceBetweenBottomMenuItems,
              child: IconButton(
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
                          buttonTitle: StringActionFormButton.create.name,
                          selectedUser: User(
                              id: 0,
                              email: '',
                              password: '',
                              status: StatusUser.pending,
                              role: Rol.student),
                        )),
                tooltip: managerBottomCases[0],
                icon: Image.asset('images/add_user.png'),
              )),
          SizedBox(
              width: spaceBetweenBottomMenuItems,
              child: IconButton(
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
                          buttonTitle: StringActionFormButton.create.name,
                          selectedCourse: Course(
                              id: 0,
                              topic: TopicCourse.programming,
                              status: StatusCourse.pending,
                              modalClass: ModalClass.mixClass,
                              coursecost: 0,
                              numCuotas: 12,
                              scheduleClass: ScheduleClass.day),
                        )),
                tooltip: managerBottomCases[1],
                icon: Image.asset('images/add_course.png'),
              )),
          SizedBox(
              width: spaceBetweenBottomMenuItems,
              child: IconButton(
                color: const Color.fromARGB(255, 33, 63, 184),
                onPressed: () => Get.to(UserList(currentUser!)),
                tooltip: managerBottomCases[2],
                icon: Image.asset('images/users.png'),
              )),
          SizedBox(
              width: spaceBetweenBottomMenuItems,
              child: IconButton(
                color: const Color.fromARGB(255, 33, 63, 184),
                onPressed: () => Get.to(CourseList(currentUser!)),
                tooltip: managerBottomCases[3],
                icon: Image.asset('images/list_courses.png'),
              )),
        ],
      ),
    );
  }
}
