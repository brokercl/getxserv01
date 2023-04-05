import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/services/user/auth_service.dart';
import 'package:gtxserv01/forms/login_form.dart';
import 'package:gtxserv01/services/course/course_service.dart';
import 'package:gtxserv01/services/user/user_service.dart';
import 'package:gtxserv01/ui/home.dart';

final loginFormKey = GlobalKey<FormState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        binding: BindingsBuilder(
          // BindingsBuilder evita Binding class
          () {
            Get.put(() => AuthService());
          },
        ),
      ),
      GetPage(
        name: '/home',
        page: () => const Home(),
        binding: BindingsBuilder(
          // BindingsBuilder evita Binding class
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
