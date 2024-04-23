import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:readism/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';
import 'package:form_validator/form_validator.dart';
import '../../../data/constans/validation.dart';

extension CustomValidationBuilder on ValidationBuilder {
  custom() => add((value) {
        if (!EmailValidator.isValidEmail(value)) {
          return 'Enter a valid email address with @smk.belajar.id';
        }
        return null;
      });
  password() => add((value) {
        if (!PasswordValidator.isValidPasswordUpper(password: value)) {
          return 'Password must contain at least 1 uppercase letter';
        }
        if (!PasswordValidator.isValidPasswordSymbol(password: value)) {
          return 'Password must contain at least 1 Sysmbol';
        }
        return null;
      });
  ValidationBuilder confirmPassword(TextEditingController controller) {
    return this
      ..add((value) {
        if (value != controller.text.toString()) {
          return 'Passwords do not match';
        }
        return null;
      });
  }
}

final validatorPassword = ValidationBuilder()
    .minLength(8, 'Password must be at least 8 characters')
    .password()
    .build();
final validator = ValidationBuilder().email().custom().build();

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Container(
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/back.png'), fit: BoxFit.fill)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/logo-tiga.png'),
                        width: 170,
                      ),
                      Column(
                        children: [
                          Text(
                            'LOGIN',
                            style:
                                TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 60,
                            height: 4,
                            color: Color(0xFF222222),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Text('Email',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromRGBO(35, 35, 34, 1),
                                        blurRadius: 2,
                                        spreadRadius: -1,
                                        offset: Offset(0, -1),
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 1,
                                        spreadRadius: -1,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                      validator: validator,
                                      controller: controller.email,
                                      autocorrect: false,
                                      autofocus: true,
                                      enableInteractiveSelection: false,
                                      textAlign: TextAlign.start,
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                        hintText: 'nando@smk.belajar.id',
                                        filled: true,
                                        // border: OutlineInputBorder(),
                                        // fillColor: Colors.white,
                                        errorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: const Color.fromARGB(
                                                    255, 255, 17, 0),
                                                width: 3)),
                                        focusedErrorBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: const Color.fromARGB(
                                                    255, 255, 17, 0),
                                                width: 3)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 3)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: Colors.black, width: 2)),
                                      )),
                                ),
                              ]),
                        ),
                      ),
                      // SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Text('Password',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromRGBO(35, 35, 34, 1),
                                          blurRadius: 2,
                                          spreadRadius: -1,
                                          offset: Offset(0, -1),
                                        ),
                                        BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 1,
                                          spreadRadius: -1,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Obx(
                                      () => TextFormField(
                                          validator: validatorPassword,
                                          controller: controller.password,
                                          obscureText: controller.isObsure.value,
                                          obscuringCharacter: '*',
                                          autocorrect: false,
                                          autofocus: false,
                                          enableInteractiveSelection: false,
                                          textAlign: TextAlign.start,
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                            suffixIcon: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    controller.isObsure.value =
                                                        !controller
                                                            .isObsure.value;
                                                  },
                                                  child: FaIcon(
                                                    (controller.isObsure.value) ==
                                                            true
                                                        ? FontAwesomeIcons.eye
                                                        : FontAwesomeIcons
                                                            .eyeSlash,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            hintText: '*****',
                                            filled: true,
                                            // border: OutlineInputBorder(),
                                            errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: const Color.fromARGB(
                                                        255, 255, 17, 0),
                                                    width: 3)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    borderSide: BorderSide(
                                                        color:
                                                            const Color.fromARGB(
                                                                255, 255, 17, 0),
                                                        width: 3)),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 3)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 2)),
                                          )),
                                    )),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.only(right: 10),
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      controller.login();
                                    },
                                    child: Obx(
                                      () => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        child: controller.loading.value
                                            ? CircularProgressIndicator()
                                            : Text('Login',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 16)),
                                      ),
                                    ),
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.black),
                                  ),
                                )
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Belum memiliki akun?',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextButton(
                              child: Text('Buat Sekarang',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade300)),
                              onPressed: () {
                                Get.toNamed(Routes.REGISTER);
                              },
                              style: ButtonStyle(
                                  minimumSize:
                                      MaterialStatePropertyAll(Size(0, 0)),
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.all(2)))),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
