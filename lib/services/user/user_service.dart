import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/entities/user.dart';
import 'package:gtxserv01/services/user/auth_service.dart';
import 'package:gtxserv01/utils.dart';
import 'package:isar/isar.dart';

class ResponseUserService {
  String returnMessage;
  Color returnMessageColor;
  bool createUpdateResult;

  ResponseUserService(
      {required this.returnMessage,
      required this.returnMessageColor,
      required this.createUpdateResult});
}

class UserService extends GetxController with StateMixin<RxList<User>> {
  late Future<Isar> db;

  UserService() {
    db = openDB();
  }

// same Future<Isar> openDB() is used by AuthService
// one solution could be open isar on Main()
// but doesnt really matters because the funtion ask firts
//     if (Isar.instanceNames.isEmpty)
// so in the case isar was opened before
// the function will return Future.value(Isar.getInstance())
// avoiding to open isar DDBB again

  final authService = Get.find<AuthService>();

  ResponseUserService responseService = ResponseUserService(
    returnMessage:
        'The returnMsg non-nullable local variable returnMsg must be assigned before it can be used.',
    returnMessageColor: const Color.fromARGB(255, 53, 120, 175),
    createUpdateResult: false,
  );

  RxList<User>? users = <User>[].obs;

  Future<RxList<User>> findUsers(FindByUserField findByField, String? s,
      Rol? newUserRoles, StatusUser? newUserStatus) async {
// el 1er parametro de findByField corresponde al criterio de busqueda
//  de un usuario en particular ya sea por su id o por su email

//  el 2do parametro s, corresponde al String que se desea buscar

//  el 3er parametro newUserRoles, corresponde al User Rol por el cual filtrar

//  finalmente el 4to parametro newUserStatus, corresponde al User Status por el cual filtrar

    final isar = await db;

    if (findByField == FindByUserField.id) {
      authService.currentUser!.role == Rol.admin ||
              authService.currentUser!.role == Rol.manager
          ? users!.value =
              await isar.users.where().idEqualTo(int.parse(s!)).findAll()
          : users!.value = await isar.users
              .filter()
              .idEqualTo(int.parse(s!))
              .not()
              .roleBetween(Rol.admin, Rol.manager)
              .limit(10)
              .findAll();
    }

    if (findByField == FindByUserField.email) {
      authService.currentUser!.role == Rol.admin
          ? users!.value =
              await isar.users.where().emailStartsWith(s!).findAll()
          : users!.value = await isar.users
              .where()
              .filter()
              .emailStartsWith(s!)
              .not()
              .roleEqualTo(
                Rol.admin,
              )
              .limit(10)
              .findAll();
    }

    if (findByField == FindByUserField.role) {
      authService.currentUser!.role == Rol.admin ||
              authService.currentUser!.role == Rol.manager
          ? users!.value = await isar.users
              .where()
              .filter()
              .roleEqualTo(newUserRoles!)
              .findAll()
          : users!.value = await isar.users
              .where()
              .filter()
              .roleEqualTo(newUserRoles!)
              .not()
              .roleBetween(Rol.admin, Rol.manager)
              .limit(10)
              .findAll();
    }
    if (findByField == FindByUserField.status) {
      authService.currentUser!.role == Rol.admin
          ? users!.value = await isar.users
              .where()
              .filter()
              .statusEqualTo(newUserStatus!)
              .findAll()
          : users!.value = await isar.users
              .where()
              .filter()
              .statusEqualTo(newUserStatus!)
              .not()
              .roleEqualTo(
                Rol.admin,
              )
              .limit(10)
              .findAll();
    }
    if (users!.isEmpty) change(users, status: RxStatus.empty());
    if (users!.isNotEmpty) change(users, status: RxStatus.success());

    return users!;
  }

  Future<ResponseUserService> createUpdateUser(
      String buttonTitle, User? createUpdateUser) async {
    final isar = await db;
    final existingUser = await isar.users.get(createUpdateUser!.id!); // get

    if (buttonTitle == StringActionFormButton.create.name) {
      if (existingUser == null) {
        try {
          isar.writeTxnSync<int>(() => isar.users.putSync(createUpdateUser));
          users!.add(createUpdateUser); // agregar a user List solo si es creado
          // si es actualizado no se agrega a la lista
          responseService.returnMessage =
              'user created with Id ${createUpdateUser.id} and email ${createUpdateUser.email}..';
          responseService.returnMessageColor =
              const Color.fromARGB(255, 53, 120, 175);
          responseService.createUpdateResult = true;
        } catch (e) {
          debugPrint(e.toString());
          responseService.returnMessage =
              'user con Id ${createUpdateUser.id} arrojo error.. User no fue creado';
          responseService.createUpdateResult = false;
        }
      } else {
        responseService.returnMessageColor =
            const Color.fromARGB(255, 211, 61, 30);
        responseService.returnMessage =
            'user con Id ${createUpdateUser.id} ya existe.. User no pudo ser creado..';
        responseService.createUpdateResult = false;
      }
    }
    if (buttonTitle == StringActionFormButton.update.name) {
      try {
        isar.writeTxnSync<int>(() => isar.users.putSync(createUpdateUser));
      } catch (e) {
        debugPrint(e.toString());
        responseService.returnMessage =
            'user con Id ${createUpdateUser.id} arrojo error.. User no pudo ser actualizado..';
        responseService.createUpdateResult = false;
      }
      final indexWhereUser =
          users!.indexWhere((user) => user.id == createUpdateUser.id);
      users![indexWhereUser] = createUpdateUser;

      responseService.returnMessage =
          'user updated with Id ${createUpdateUser.id} and email ${createUpdateUser.email}..';
      responseService.returnMessageColor =
          const Color.fromARGB(255, 186, 164, 36);
      responseService.createUpdateResult = true;
    }

    return responseService;
  }

  Future logicDeleteUser(int userId) async {
    final isar = await db;
    authService.currentUser!.status = StatusUser.deleted;
    isar.users.putSync(authService.currentUser!);
    users!.removeWhere((user) => user.id == userId);
  }

  Future fisicDdeleteUserFromDDBB(int userId) async {
    final isar = await db;

    try {
      isar.writeTxnSync(() => isar.users.deleteSync(userId));
    } catch (e) {
      debugPrint(e.toString());
    }

    users!.removeWhere((user) => user.id == userId);
  }

//   updateUser(User updateUser) async {
//     final isar = await db;

//     // if updateUser.id exist => the register will be updated
//     // if not, the register will be created..

//     await isar.writeTxn(() async {
//       await isar.users.put(updateUser);
//     });

// // indexWhere is used to find the index of a user with a specific id

//     users![users!.indexWhere((user) => user.id == updateUser.id)] = updateUser;
//   }

  @override
  void onInit() {
// si se logea Rol.admin || Rol.manager, coloco findAllEmails = '' sin nada, no null
// lo que hace que findUsers devuelva todos los emails
// por el contrario si findAllEmails = authService.currentUser!.email
// entonces findUsers devolvera solo ese email, para el caso de un student
// quien no necesita mirar los otros emails..
    var findAllEmails = authService.currentUser!.role == Rol.admin ||
            authService.currentUser!.role == Rol.manager
        ? ''
        : authService.currentUser!.email;

    findUsers(FindByUserField.email, findAllEmails, null, null).then(
        (users) => change(users, status: RxStatus.success()),
        onError: (e) => change(null, status: RxStatus.error(e.toString())));
    change(null, status: RxStatus.loading());
    super.onInit();
  }
}
