import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/models/user.dart';
import 'package:gtxserv01/services/user_service.dart';

class UserForm extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController userAgeController;
  final userService = Get.find<UserService>();
  final formKey = GlobalKey<FormState>();
  final String buttonTitle;

  final User? user;

  UserForm(
      {super.key,
      required this.buttonTitle,
      required this.userNameController,
      required this.userAgeController,
      required this.user});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: userNameController,
            decoration: const InputDecoration(labelText: 'Nombre'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese un nombre';
              }
              return null;
            },
          ),
          TextFormField(
            controller: userAgeController,
            decoration: const InputDecoration(labelText: 'Edad'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese una edad';
              }
              if (!(int.parse(value) >= 0 && int.parse(value) <= 120)) {
                return 'La edad debe estar entre 0 y 120';
              }
              return null;
            },
            keyboardType: TextInputType.number,
          ),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 11, 101, 14)),
                onPressed: () {
                  String? message;
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    if (buttonTitle == 'crear usuario') {
                      userService.createUser(userNameController.text.trim(),
                          int.tryParse(userAgeController.text)!);
                      message = " creado..";
                    }

                    if (buttonTitle == 'Actualizar Usuario') {
                      print('orden => actualizr usuario ${user!.name}');
                      user!.name = userNameController.text;
                      user!.age = int.tryParse(userAgeController.text);
                      userService.updateUser(user!);
                      message = "actualizado....";
                    }

                    Get.back();
                    Get.snackbar(
                      snackPosition: SnackPosition.BOTTOM,
                      "Usuario ${userNameController.text} $message..",
                      "..",
                    );
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
                  onPressed: () => formKey.currentState!.reset(),
                  icon: const Icon(Icons.reset_tv_sharp)),
            ],
          ),
        ],
      ),
    );
  }
}
