import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readism/app/routes/app_pages.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 4000), () {
      Get.offAllNamed(Routes.HOMESCREEN);
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/back.png'),fit: BoxFit.fill)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Image(
              image: AssetImage('assets/images/logo.png'),
            ),
            Image(
              image: AssetImage('assets/images/logo-dua.png'),
            ),
          ],
        ),
      ),
    );
  }
}
