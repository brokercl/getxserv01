import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/forms/user_form.dart';
import 'package:gtxserv01/models/user.dart';
import 'package:gtxserv01/services/user_service.dart';
import 'package:gtxserv01/ui/bottom.dart';

class Home extends GetView<UserService> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        centerTitle: true,
      ),
      body: controller.obx(
        (users) => listUsers(controller, users),
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const Text('No data found'),
        onError: (error) => Text(controller.state.toString()),
      ),
      bottomNavigationBar: bottom(),
    );
  }
}

listUsers(UserService controller, List<User>? users) {
  return Obx(
    (() => ListView.separated(
        itemCount: users!.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) {
          final user = users[i];
          return Dismissible(
            key: Key(user.id.toString()),
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
              print('delete user with id $i');
              controller.deleteUser(users[i].id);
              Get.snackbar(
                snackPosition: SnackPosition.BOTTOM,
                "Usuario ${users[i].name!} eliminado..",
                "..",
              );
            },
            child: GestureDetector(
              onTap: () => Get.defaultDialog(
                title: 'Actualizar Usuario ${users[i].name}',
                content: UserForm(
                  buttonTitle: 'Actualizar Usuario',

                  // es de vital importancia tener en cuenta
                  // user_form.dart se comportata que dependiendo del
                  // valor de buttonTitle: 'Actualizar Usuario', o
                  //bottom.dart
                  // buttonTitle: 'crear usuario',

                  // nameController toma su valor desde text: users[i].name
                  // usado paral actualiar usuario en el formulario
                  // mismo para ageController
                  userNameController:
                      TextEditingController(text: users[i].name),
                  userAgeController:
                      TextEditingController(text: users[i].age.toString()),
                  user: users[i],
                ),
              ),
              child: ListTile(
                title: Text(users[i].name!),
              ),
            ),
          );
        })),
  );
}
