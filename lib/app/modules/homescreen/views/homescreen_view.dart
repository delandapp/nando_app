import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readism/app/routes/app_pages.dart';

import '../controllers/homescreen_controller.dart';

class HomescreenView extends GetView<HomescreenController> {
  const HomescreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/back.png'),fit: BoxFit.fill)
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/images/logo-login.png')),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 130,vertical: 8),
                    child: Text('Login',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF232222),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6), // <-- Radius
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120,vertical: 8),
                    child: Text('Register',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black)),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black,width: 2),
                      borderRadius: BorderRadius.circular(6), // <-- Radius
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
