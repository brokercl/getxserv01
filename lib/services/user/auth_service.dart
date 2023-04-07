import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/entities/user.dart';
import 'package:gtxserv01/main.dart';
import 'package:gtxserv01/ui/courses_list.dart';
import 'package:gtxserv01/ui/users_list.dart';
import 'package:gtxserv01/utils.dart';
import 'package:isar/isar.dart';

class AuthService extends GetxController {
  late Future<Isar> db;
  AuthService() {
    db = openIsarDB();
  }

  final Rxn<User?> _currentUser = Rxn<User?>(null);

  User? get currentUser => _currentUser.value;

  void setCurrentUser(User? user) {
    _currentUser.value = user;
    update();
  }

  Future<User?> login(String email, String password) async {
    final isar = await db;

// login devuelve el currentUser
// lo que es importantisimo
// ya que dependiendo de su rol
// sera lo que le esta permitido hacer.
// Estos casos de uso estan definidos en
// enum Rol en user.dart

    setCurrentUser(await isar.users.where().emailEqualTo(email).findFirst());

    if (currentUser != null && currentUser?.password == password) {
      currentUser!.role == Rol.admin || currentUser!.role == Rol.manager
          ? Get.to(() => UserList())
          : Get.to(
              () => CourseList(currentUser!)); // success login, Go to Home..
    } else {
      Get.snackbar('Error Trying Login', 'Invalid email or password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color.fromARGB(255, 204, 41, 29));
    }
    return currentUser!;
  }

  signOut() {
    loginFormKey.currentState!.reset();
    // Set current user to null
    _currentUser.value = null;
    Get.back();
  }
}
