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
