import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/entities/user.dart';
import 'package:gtxserv01/services/user/auth_service.dart';
import 'package:gtxserv01/services/user/user_service.dart';
import 'package:gtxserv01/utils.dart';

class AddUpdateUserForm extends StatelessWidget {
  final userService = Get.find<UserService>();
  final authService = Get.find<AuthService>();
  final formKey = GlobalKey<FormState>();
  final String buttonTitle;
  final User selectedUser;
  AddUpdateUserForm(
      {super.key, required this.buttonTitle, required this.selectedUser});

  @override
  Widget build(BuildContext context) {
    final userIdController = TextEditingController(
        text: buttonTitle == StringActionFormButton.update.name
            ? selectedUser.id.toString()
            : null);
    final emailController = TextEditingController(
        text: buttonTitle == StringActionFormButton.update.name
            ? selectedUser.email.toString()
            : null);
    final userPasswordController = TextEditingController(
        text: buttonTitle == StringActionFormButton.update.name
            ? selectedUser.password.toString()
            : null);

    RxBool obscureText = true.obs;
    bool atLeastOneFormFieldHasChanged = false;
    var userStatusValue = selectedUser.status;
    Rol userRolesValue = selectedUser.role;

    setEnabledBooleansByRol();
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            enabled: enableIdTextEditing,
            controller: userIdController,
            keyboardType: TextInputType.number,
            inputFormatters: [LengthLimitingTextInputFormatter(12)],
            decoration: const InputDecoration(labelText: 'Id'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese su Id';
              }
              return null;
            },
            onChanged: (value) => atLeastOneFormFieldHasChanged = true,
          ),
          TextFormField(
            enabled: enableEmailTextEditing,
            controller: emailController,
            decoration: const InputDecoration(labelText: 'email'),
            validator: (value) {
              if (value == null || value.isEmpty || !validateEmail(value)) {
                return 'Por favor ingrese un email valido';
              }
              return null;
            },
            onChanged: (value) => atLeastOneFormFieldHasChanged = true,
          ),
          Obx(
            () => TextFormField(
              enabled: enablePasswordTextEditing,
              controller: userPasswordController,
              obscureText: obscureText
                  .value, // Set the initial value of obscureText to true
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                    obscureText.value ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () => obscureText.value = !obscureText.value,
                  // Toggle the value of obscureText
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 3) {
                  return 'Por favor ingrese un password valido de al menos 3 caracteres';
                }
                return null;
              },
              onChanged: (value) => atLeastOneFormFieldHasChanged = true,
            ),
          ),
          enableRolDropdownButtonFormField
              ? DropdownButtonFormField<Rol>(
                  value: userRolesValue,
                  items: getDropdownButtonFormFieldList(
                          authService.currentUser!.role)
                      .map((roles) => DropdownMenuItem(
                            value: roles,
                            child: Text(roles.name),
                          ))
                      .toList(),

                  onChanged: (newUserRoles) {
                    atLeastOneFormFieldHasChanged = true;
                    userRolesValue = newUserRoles!;
                  }, // save only changed fields..
                  decoration: const InputDecoration(
                    labelText: 'Roles',
                  ),
                )
              : Text('Role ${selectedUser.role.name}'),
          enableStatusDropdownButtonFormField
              ? DropdownButtonFormField<StatusUser>(
                  value: userStatusValue,
                  items: StatusUser.values
                      .map((status) => DropdownMenuItem(
                            value: status,
                            child: Text(status.name),
                          ))
                      .toList(),
                  onChanged: (newUserStatus) {
                    userStatusValue = newUserStatus!;
                    atLeastOneFormFieldHasChanged = true;
                  }, // save only changed fields..
                  decoration: const InputDecoration(
                    labelText: 'Status',
                  ),
                )
              : Text('Status ${selectedUser.status.name}'),
          Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 11, 101, 14)),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (!atLeastOneFormFieldHasChanged) {
                      Get.snackbar(' failed to $buttonTitle user',
                          'change at least one field to proceed..',
                          snackPosition: SnackPosition.BOTTOM);
                    } else {
                      userService
                          .createUpdateUser(
                              buttonTitle,
                              User(
                                id: int.tryParse(userIdController.text),
                                email: emailController.text.trim(),
                                password: userPasswordController.text.trim(),
                                status: userStatusValue,
                                role: userRolesValue,
                              ))
                          .then((ResponseUserService responseService) {
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
                    formKey.currentState!.reset();
                  },
                  icon: const Icon(Icons.reset_tv_sharp)),
            ],
          ),
        ],
      ),
    );
  }
}
