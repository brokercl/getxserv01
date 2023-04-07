import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/forms/add_update_user_form.dart';
import 'package:gtxserv01/entities/user.dart';
import 'package:gtxserv01/services/user/auth_service.dart';
import 'package:gtxserv01/services/user/user_service.dart';
import 'package:gtxserv01/ui/manager_bottom.dart';
import 'package:gtxserv01/ui/student_bottom.dart';
import 'package:gtxserv01/utils.dart';

class UserList extends GetView<UserService> {
  final TextEditingController textEditingController = TextEditingController();
  User? get currentUser => Get.find<AuthService>().currentUser;
  final userService = Get.find<UserService>();

  UserList({super.key});

  @override
  Widget build(BuildContext context) {
    Rol userRole = Rol.student;
    StatusUser userStatus = StatusUser.pending;
    Rx<FindByUserField> findByField = FindByUserField.email.obs;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              highlightColor: Colors.blue,
              tooltip: 'logout',
              onPressed: () => AuthService().signOut(),
              icon: const Icon(Icons.logout)),
//                'email ${currentUser.email} \n role ${currentUser.role.name} \n status ${currentUser.status.name}',
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
            Visibility(
              visible: currentUser!.role == Rol.admin ||
                  currentUser!.role == Rol.manager ||
                  currentUser!.role == Rol.tutor,
              child: Row(
                children: [
                  SizedBox(
                    width: 120.0,
                    // presenta opciones a busar por user field, id, email, role, status
                    child: DropdownButtonFormField<FindByUserField>(
                      value: findByField.value,
                      items: FindByUserField.values
                          .map((fields) => DropdownMenuItem(
                                value: fields,
                                child: Text(fields.name),
                              ))
                          .toList(),
                      onChanged: (newFindByField) {
                        textEditingController.clear();
                        findByField.value = newFindByField!;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Field',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Obx(
                      (() => SizedBox(
                            width: 110.0,
                            child: findByField.value == FindByUserField.role
                                ? DropdownButtonFormField(
                                    value: userRole,
                                    items: authService.currentUser!.role ==
                                            Rol.admin
                                        ? Rol.values
                                            .map((roles) => DropdownMenuItem(
                                                  value: roles,
                                                  child: Text(roles.name),
                                                ))
                                            .toList()
                                        : allowedAllOtherUsersRolToFind
                                            .map((roles) => DropdownMenuItem(
                                                  value: roles,
                                                  child: Text(roles.name),
                                                ))
                                            .toList(),
                                    onChanged: (newUserRoles) {
                                      userRole = newUserRoles!;
                                      userService.findUsers(
                                          FindByUserField.role,
                                          null,
                                          newUserRoles,
                                          null);
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Roles',
                                    ),
                                  )
                                : findByField.value == FindByUserField.status
                                    ? DropdownButtonFormField(
                                        value: userStatus,
                                        items: StatusUser.values
                                            .map((status) => DropdownMenuItem(
                                                  value: status,
                                                  child: Text(
                                                      status.name.toString()),
                                                ))
                                            .toList(),
                                        onChanged: (newUserStatus) {
                                          userStatus = newUserStatus!;
                                          userService.findUsers(
                                              FindByUserField.status,
                                              null,
                                              null,
                                              newUserStatus);
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
                                        onSubmitted: (notUsed) => userService
                                            .findUsers(
                                                FindByUserField.status,
                                                textEditingController.text,
                                                userRole,
                                                userStatus)
                                            .then((users) =>
                                                listUsers(controller, users))),
                          )),
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () => userService
                          .findUsers(findByField.value,
                              textEditingController.text, userRole, userStatus)
                          .then((users) => listUsers(controller, users))),
                ],
              ),
            ),
          ],
        ),
        body: controller.obx(
          (users) => listUsers(controller, users),
          onLoading: const Center(child: CircularProgressIndicator()),
          onEmpty: const Text('No users founded..'),
          onError: (error) => Text(controller.state.toString()),
        ),
        bottomNavigationBar: authService.currentUser!.role == Rol.admin ||
                authService.currentUser!.role == Rol.manager
            // Rol.admin && Rol.manager use same forms diferrence in status and rols
            ? ManagerBottom()
            : StudentBottom());
  }
}

listUsers(UserService userService, List<User>? users) {
  return Obx((() => ListView.builder(
      itemCount: users!.length,
      itemBuilder: (context, i) {
        final user = users[i];
        return Container(
          color: setDialogBackgroundColorByUserStatus(users[i].status),
          child: Dismissible(
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
              userService.fisicDdeleteUserFromDDBB(users[i].id!);
              Get.snackbar(
                snackPosition: SnackPosition.BOTTOM,
                "Usuario ${users[i].email!} eliminado..",
                "..",
              );
            },
            child: GestureDetector(
              onTap: () => Get.defaultDialog(
                backgroundColor:
                    setDialogBackgroundColorByUserStatus(users[i].status),
                title:
                    '${authService.currentUser!.role} ${StringActionFormButton.update.name}',
                content: AddUpdateUserForm(
                  buttonTitle: StringActionFormButton.update.name,

                  /// es de vital importancia tener en cuenta que
                  /// user_form.dart se comportara dependiendo del
                  /// valor enum StringActionFormButton {
                  ///  create,
                  ///  update,
                  ///  }

                  selectedUser: users[i],
                ),
              ),
              child: ListTile(
                title: Text(users[i].email!),
                subtitle: Text('id ${users[i].id!.toString()}'),
                trailing: Column(
                  children: [
                    Text(users[i].role.name.toString()),
                    Text(users[i].status.name.toString()),
                  ],
                ),
              ),
            ),
          ),
        );
      })));
}
