import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/entities/course.dart';
import 'package:gtxserv01/services/user/auth_service.dart';
import 'package:gtxserv01/utils.dart';
import 'package:isar/isar.dart';

class ResponseCourseService {
  String returnMessage;
  Color returnMessageColor;
  bool createUpdateResult;

  ResponseCourseService(
      {required this.returnMessage,
      required this.returnMessageColor,
      required this.createUpdateResult});
}

class CourseService extends GetxController with StateMixin<RxList<Course>> {
  late Future<Isar> db;

  CourseService() {
    db = openDB();
  }

  final authService = Get.find<AuthService>();

  get currentUser => authService.currentUser;

  ResponseCourseService responseService = ResponseCourseService(
    returnMessage:
        'The returnMsg non-nullable local variable returnMsg must be assigned before it can be used.',
    returnMessageColor: const Color.fromARGB(255, 53, 120, 175),
    createUpdateResult: false,
  );

  RxList<Course>? courses = <Course>[].obs;

  RxInt cuotas = 1.obs;
  var selectedSchedule = ScheduleClass.day.obs;

  void updateCuotas(int value) {
    cuotas.value = value; // Update the value of cuotas
  }

// can find courses by topic or status
  Future<RxList<Course>> findCourses(FindByCourseField findByCourseField,
      int? id, TopicCourse? topicCourse, StatusCourse? statusCourse) async {
// el 1er parametro de findByField corresponde al criterio de busqueda
//  de un usuario en particular ya sea por su id o por su email

//  el 2do parametro s, corresponde al String que se desea buscar

//  finalmente el 4to parametro newCourseStatus, corresponde al Course Status por el cual filtrar

    final isar = await db;

    if (findByCourseField == FindByCourseField.id) {
      courses!.value = id != null
          ? await isar.courses.where().idEqualTo(id).limit(10).findAll()
          : await isar.courses.where().limit(10).findAll();
    }

    if (findByCourseField == FindByCourseField.topic) {
      courses!.value = await isar.courses
          .where()
          .filter()
          .topicEqualTo(topicCourse!)
          .limit(10)
          .findAll();
    }
    if (findByCourseField == FindByCourseField.status) {
      courses!.value = await isar.courses
          .where()
          .filter()
          .statusEqualTo(statusCourse!)
          .limit(10)
          .findAll();
    }
    if (courses!.isEmpty) change(courses, status: RxStatus.empty());
    if (courses!.isNotEmpty) change(courses, status: RxStatus.success());

    return courses!;
  }

  Future<ResponseCourseService> createUpdateCourse(
      String buttonTitle, Course? createUpdateCourse) async {
    final isar = await db;
    final existingCourse =
        await isar.courses.get(createUpdateCourse!.id!); // get

    if (buttonTitle == StringActionFormButton.create.name) {
      if (existingCourse == null) {
        try {
          isar.writeTxnSync<int>(
              () => isar.courses.putSync(createUpdateCourse));
          courses!.add(
              createUpdateCourse); // agregar a course List solo si es creado
          // si es actualizado no se agrega a la lista
          responseService.returnMessage =
              'course created with Id ${createUpdateCourse.id} and topic ${createUpdateCourse.topic}..';
          responseService.returnMessageColor =
              const Color.fromARGB(255, 53, 120, 175);
          responseService.createUpdateResult = true;
        } catch (e) {
          debugPrint(e.toString());
          responseService.returnMessage =
              'course con Id ${createUpdateCourse.id} arrojo error.. Course no fue creado';
          responseService.createUpdateResult = false;
        }
      } else {
        responseService.returnMessageColor =
            const Color.fromARGB(255, 211, 61, 30);
        responseService.returnMessage =
            'course con Id ${createUpdateCourse.id} ya existe.. Course no pudo ser creado..';
        responseService.createUpdateResult = false;
      }
    }
    if (buttonTitle == StringActionFormButton.update.name) {
      try {
        isar.writeTxnSync<int>(() => isar.courses.putSync(createUpdateCourse));
      } catch (e) {
        debugPrint(e.toString());
        responseService.returnMessage =
            'course con Id ${createUpdateCourse.id} arrojo error.. Course no pudo ser actualizado..';
        responseService.createUpdateResult = false;
      }
      final indexWhereCourse =
          courses!.indexWhere((course) => course.id == createUpdateCourse.id);
      courses![indexWhereCourse] = createUpdateCourse;

      responseService.returnMessage =
          'course updated with Id ${createUpdateCourse.id} and topic ${createUpdateCourse.topic}..';
      responseService.returnMessageColor =
          const Color.fromARGB(255, 186, 164, 36);
      responseService.createUpdateResult = true;
    }

    return responseService;
  }

  Future logicDeleteCourse(Course courseToLogicDelete) async {
    final isar = await db;

    courseToLogicDelete.status = StatusCourse.deleted;
    isar.courses.putSync(courseToLogicDelete);

    courses!.removeWhere((course) => course.id == course.id);
  }

  Future fisicDdeleteCourseFromDDBB(Course courseToFisicDelete) async {
    final isar = await db;

    try {
      isar.writeTxnSync(() => isar.courses.deleteSync(courseToFisicDelete.id!));
    } catch (e) {
      debugPrint(e.toString());
    }

    courses!.removeWhere((course) => course.id == courseToFisicDelete.id);
  }

  @override
  void onInit() {
    findCourses(FindByCourseField.topic, null, TopicCourse.programming,
            StatusCourse.active)
        .then((courses) => change(courses, status: RxStatus.success()),
            onError: (e) => change(null, status: RxStatus.error(e.toString())));
    change(null, status: RxStatus.loading());
    super.onInit();
  }
}
