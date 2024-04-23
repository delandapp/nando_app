import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:readism/app/components/bookDetails.dart';

import '../controllers/detailbook_controller.dart';

class DetailbookView extends GetView<DetailbookController> {
  const DetailbookView({Key? key}) : super(key: key);
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
                    Image.network(state!.state1!.coverBuku.toString(), height: MediaQuery.of(context).size.height * 0.25,width: double.infinity,fit: BoxFit.cover,),
                    Image.asset("assets/images/back.png", height: MediaQuery.of(context).size.height * 0.7,width: MediaQuery.of(context).size.width * 1,fit: BoxFit.fill,),
                  ],
                ),
                Positioned(
                  top: 10,
                  left: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20),),padding: const EdgeInsets.all(10),child: const Icon(Icons.arrow_back,color: Colors.white,),),
                        GestureDetector(
                          onTap: () => controller.addKoleksiBuku(),
                          child: Obx(
                            () => Icon(
                              Icons.add_link,
                              size: 30,
                              color: controller.detailBuku.value.koleksi == true
                                  ? const Color(0xFF00D193)
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned.fill(
                  top: 70,
                  left: 0,
                  right: 0,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: MyBookDetails(
                      controller: controller,
                      dataBookDetails: state.state1!,
                      dataUlasan: state.state2!,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
