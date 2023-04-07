import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtxserv01/services/user/auth_service.dart';
import 'package:gtxserv01/services/user/user_service.dart';
import 'package:gtxserv01/utils.dart';

class LoginForm extends GetView<UserService> {
  final authService = Get.find<AuthService>();

  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool obscureText = RxBool(true);
    TextEditingController emailController =
        TextEditingController(text: '@gmail.com');
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/login_image.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Form(
              key: loginFormKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFormField(
                      controller: emailController,
                      maxLength: 50,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty || !validateEmail(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      autofocus: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        controller: passwordController,
                        maxLength: 50,
                        obscureText: obscureText
                            .value, // Set the initial value of obscureText to true
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureText.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () =>
                                obscureText.value = !obscureText.value,
                            // Toggle the value of obscureText
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            return 'Por favor ingrese un password valido de al menos 3 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 1, 109, 46))),
                        onPressed: () {
                          if (loginFormKey.currentState!.validate()) {
                            authService.login(
                                emailController.text, passwordController.text);
                          }
                        },
                        //  color: Colors.blue,
                        child: const SizedBox(
                          width: 150.0,
                          height: 50.0,
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 13, 110, 189))),
                        onPressed: () {
                          // TODO: Implement create account functionality
                        },
                        //  color: Colors.blue,
                        child: const SizedBox(
                          width: 150.0,
                          height: 50.0,
                          child: Center(
                            child: Text(
                              'Create Account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
