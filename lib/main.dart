import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/services/user_service.dart';
import 'package:gtxserv01/ui/home.dart';

Future<void> main() async {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.indigo,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    initialRoute: '/home',
    getPages: [
      GetPage(
        name: '/home',
        page: () => Home(),
        binding: BindingsBuilder(
          // BindingsBuilder evita Binding class
          () {
            Get.lazyPut(() => UserService());
          },
        ),
      ),
    ],
  ));
}
