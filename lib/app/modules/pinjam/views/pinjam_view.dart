import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readism/app/components/laporan.dart';
import 'package:readism/app/routes/app_pages.dart';

import '../controllers/pinjam_controller.dart';

class PinjamView extends GetView<PinjamController> {
  const PinjamView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
      (state) => SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.white),
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    Image.asset("assets/images/bg-nav.png", height: MediaQuery.of(context).size.height * 0.3,width: double.infinity,fit: BoxFit.cover,),
                    Image.asset("assets/images/back.png", height: MediaQuery.of(context).size.height * 0.7,width: MediaQuery.of(context).size.width * 1,fit: BoxFit.fill,),
                  ],
                ),
                Positioned(
                  top: 10,
                  left: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () => Get.offAllNamed(Routes.DASHBOARD),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40),),padding: const EdgeInsets.all(2),child: const Icon(Icons.arrow_back,color: Colors.black,),),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 70,
                  left: 0,
                  right: 0,
                  child: MyLaporan(data: state!.state1!,),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

}
