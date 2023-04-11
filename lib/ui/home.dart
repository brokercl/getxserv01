import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/forms/login_form.dart';
import 'package:gtxserv01/utils.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
            tooltip: 'login',
            onPressed: () => Get.to(() => LoginForm()),
            icon: const Icon(Icons.login)),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              'images/informatic_center.png',
              width: 300,
              height: 300,
            ),
          ),
        ),
      ),
    );
  }
}
