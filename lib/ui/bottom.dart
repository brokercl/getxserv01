import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/forms/user_form.dart';

List<String> titleItems = [
  'defaultDialog',
  'snackbar',
  'incrementa counter',
];

double spaceBetweenBottomMenuItems =
    500 / titleItems.length; // width / No menu items
bottom() => Container(
      height: 60,
      color: Colors.amber,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(
            width: spaceBetweenBottomMenuItems,
            child: IconButton(
                tooltip: titleItems[0],
                color: const Color.fromARGB(255, 56, 151, 59),
                onPressed: () => {},
                icon: const Icon(Icons.account_balance)),
          ),
          SizedBox(
            width: spaceBetweenBottomMenuItems,
            child: IconButton(
                tooltip: titleItems[1],
                color: const Color.fromARGB(255, 186, 67, 59),
                onPressed: () => {},
                icon: const Icon(Icons.ac_unit)),
          ),
          SizedBox(
            width: spaceBetweenBottomMenuItems,
            child: IconButton(
                color: const Color.fromARGB(255, 33, 63, 184),
                onPressed: () =>
                    // i is the index used in both forms, create and update
                    // and its a necesary parameter required by its constructor
                    //but in this form, that is used to create a new user is useless
                    Get.defaultDialog(
                        title: 'Creando nuevo Usuario..',
                        content: UserForm(
                          buttonTitle: 'crear usuario',
                          userNameController: TextEditingController(text: null),
                          userAgeController: TextEditingController(text: null),
                          user: null,
                        )),
                tooltip: titleItems[2],
                icon: const Icon(Icons.add)),
          ),
        ],
      ),
    );
