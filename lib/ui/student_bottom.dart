import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/forms/add_update_user_form.dart';
import 'package:gtxserv01/entities/user.dart';
import 'package:gtxserv01/services/user/auth_service.dart';

import '../utils.dart';

class StudentBottom extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final authService = Get.find<AuthService>();
  StudentBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.amber,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
              width: withSizedBoxBottom,
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
                tooltip: userBottomCases[0],
                icon: Image.asset('images/shop_course.png'),
              )),
        ],
      ),
    );
  }
}
