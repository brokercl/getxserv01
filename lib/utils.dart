import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/entities/course.dart';
import 'package:gtxserv01/entities/note.dart';
import 'package:gtxserv01/entities/payment.dart';
import 'package:gtxserv01/entities/user.dart';
import 'package:gtxserv01/services/user/auth_service.dart';
import 'package:isar/isar.dart';

final authService = Get.find<AuthService>();

Future<Isar> openDB() async {
  if (Isar.instanceNames.isEmpty) {
    return await Isar.open(
      [UserSchema, CourseSchema, NoteSchema, PaymentSchema],
      inspector: true,
    );
  }
  return Future.value(Isar.getInstance());
}

enum FindByUserField {
  id,
  email,
  role,
  status,
}

enum StringActionFormButton {
  create,
  update,
}

enum FindByCourseField {
  id,
  topic,
  status,
}

double withSizedBoxBottom = 60;

capitalizedFirtsCharacter(String s) =>
    s.substring(0, 1).toUpperCase() + s.substring(1);

// las siguientes listas trabajam como un map, pero son mas faciles de manipular
// trabajan en el bottom del widget activando o desactivando botones
// dependiendo de los clicks del user
// ejemplo si pincha en payments, adduser and addCourse seran desactivados, etx
// si pincha en addUser, solo ese boton, sera activado
// si pincha en addUCourse, solo ese boton, sera activado

RxList addUserBottom = [true, 'add user'].obs;
RxList addCourseBottom = [true, 'add course'].obs;
RxList listUsersBottom = [true, 'list Users'].obs;
RxList listCoursesBottom = [true, 'list Courses'].obs;
RxList paymentsBottom = [true, 'payments'].obs;
RxList gridNetBottom = [true, 'Grid Net'].obs;

final List<String> userBottomCases = [
  'take course',
];

bool validateEmail(String email) {
  final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return regex.hasMatch(email);
}

bool enableIdTextEditing = false;
bool enableEmailTextEditing = false;
bool enablePasswordTextEditing = false;
bool enableRolDropdownButtonFormField = false;
bool enableStatusDropdownButtonFormField = false;
bool enableCourseCostTextEditing = false;

setEnabledBooleansByRol() {
  switch (authService.currentUser!.role) {
    case Rol.admin:
      enableIdTextEditing = true;
      enableEmailTextEditing = true;
      enablePasswordTextEditing = true;
      enableRolDropdownButtonFormField = true;
      enableStatusDropdownButtonFormField = true;
      enableCourseCostTextEditing = true;
      break;

    case Rol.manager:
      enableIdTextEditing = true;
      enableEmailTextEditing = true;
      enablePasswordTextEditing = true;
      enableRolDropdownButtonFormField = true;
      enableStatusDropdownButtonFormField = true;
      enableCourseCostTextEditing = true;
      break;
    case Rol.tutor:
      enableIdTextEditing = false;
      enableEmailTextEditing = true;
      enablePasswordTextEditing = true;
      enableRolDropdownButtonFormField = false;
      enableStatusDropdownButtonFormField = false;
      enableCourseCostTextEditing = false;
      break;
    case Rol.teacher:
      enableIdTextEditing = false;
      enableEmailTextEditing = true;
      enablePasswordTextEditing = true;
      enableRolDropdownButtonFormField = false;
      enableStatusDropdownButtonFormField = false;
      enableCourseCostTextEditing = false;
      break;
    case Rol.student:
      enableIdTextEditing = false;
      enableEmailTextEditing = true;
      enablePasswordTextEditing = true;
      enableRolDropdownButtonFormField = false;
      enableStatusDropdownButtonFormField = false;
      enableCourseCostTextEditing = false;
      break;
    default:
  }
}

String getScheduleClassName(ScheduleClass scheduleClass) {
  switch (scheduleClass) {
    case ScheduleClass.day:
      return 'Day';
    case ScheduleClass.afternoon:
      return 'Afternoon';
    case ScheduleClass.evening:
      return 'Evening';
    default:
      return '';
  }
}

List<Rol> allowedAdminrolesToFind = Rol.values.toList();

// si Rol.manager se logea y si quito su rol de allowedAllOtherUsersRolToFind
// al listar los usuarios y pinchar en el usuario manager, app arrojara error

//There should be exactly one item with [DropdownButton]'s value: Rol.manager.
// por eso es importante que Rol.manager,este en la lista de opciones en allowedAllOtherUsersRolToFind
List<Rol> allowedAllOtherUsersRolToFind = [
  Rol.manager,
  Rol.utp,
  Rol.commerce,
  Rol.tutor,
  Rol.teacher,
  Rol.student
];

List<Rol> getDropdownButtonFormFieldList(Rol rol) {
  switch (rol) {
    case Rol.admin:
      return allowedAdminrolesToFind;
    case Rol.manager:
      return allowedAllOtherUsersRolToFind;
    case Rol.utp:
      return allowedAllOtherUsersRolToFind;
    case Rol.commerce:
      return allowedAllOtherUsersRolToFind;
    case Rol.tutor:
      return allowedAllOtherUsersRolToFind;
    case Rol.teacher:
      return allowedAllOtherUsersRolToFind;
    case Rol.student:
      return allowedAllOtherUsersRolToFind;
  }
}

Color setDialogBackgroundColorByUserStatus(StatusUser status) {
  Color backgroundColor;
  switch (status) {
    case StatusUser.active:
      backgroundColor = const Color.fromARGB(255, 66, 181, 101);
      break;
    case StatusUser.pending:
      backgroundColor = const Color.fromARGB(255, 194, 187, 56);
      break;
    case StatusUser.suspended:
      backgroundColor = const Color.fromARGB(255, 173, 92, 113);
      break;
    case StatusUser.deleted:
      backgroundColor = const Color.fromARGB(255, 111, 79, 226);
      break;
    default:
      backgroundColor = Colors.transparent;
  }
  return backgroundColor;
}

Color setDialogBackgroundColorByCourseStatus(StatusCourse status) {
  Color backgroundColor;
  switch (status) {
    case StatusCourse.active:
      backgroundColor = const Color.fromARGB(255, 66, 181, 101);
      break;
    case StatusCourse.pending:
      backgroundColor = const Color.fromARGB(255, 194, 187, 56);
      break;
    case StatusCourse.suspended:
      backgroundColor = const Color.fromARGB(255, 173, 92, 113);
      break;
    case StatusCourse.deleted:
      backgroundColor = const Color.fromARGB(255, 64, 43, 141);
      break;
    default:
      backgroundColor = Colors.transparent;
  }
  return backgroundColor;
}
