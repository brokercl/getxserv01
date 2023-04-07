import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/entities/course.dart';
import 'package:gtxserv01/entities/note.dart';
import 'package:gtxserv01/entities/payment.dart';
import 'package:gtxserv01/entities/user.dart';
import 'package:gtxserv01/services/user/auth_service.dart';
import 'package:gtxserv01/forms/login_form.dart';
import 'package:gtxserv01/services/course/course_service.dart';
import 'package:gtxserv01/services/user/user_service.dart';
import 'package:gtxserv01/ui/home.dart';
import 'package:isar/isar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    openIsarDB();
  } catch (e) {
    debugPrint(e.toString());
  }
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    initialRoute: '/home',
    getPages: [
      GetPage(
        name: '/login',
        page: () => LoginForm(),
      ),
      GetPage(
        name: '/home',
        page: () => const Home(),
        binding: BindingsBuilder(
          // BindingsBuilder evita Binding class
          // on initialRoute: '/home', in this case
          // load ALL service as lazyPut, this meangs
          // the service will register buy only will be used when nedded
          // fenix is for call service whenever is needed
          // this way is like initService()
          // but you can see inmediatley
          () {
            Get.lazyPut(() => AuthService(), fenix: true);
            Get.lazyPut(() => UserService(), fenix: true);
            Get.lazyPut(() => CourseService(), fenix: true);
          },
        ),
      ),
    ],
  ));
}

Future<Isar> openIsarDB() async {
  if (Isar.instanceNames.isEmpty) {
    return await Isar.open(
      [UserSchema, CourseSchema, NoteSchema, PaymentSchema],
      inspector: true,
    );
  }
  return Future.value(Isar.getInstance());
}
