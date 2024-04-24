import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:readism/app/components/bookSearch.dart';
import 'package:readism/app/components/buildSection.dart';
import 'package:readism/app/components/kategory.dart';
import 'package:readism/app/components/myInput.dart';
import 'package:readism/app/components/navProfil.dart';
import 'package:readism/app/components/searchInput.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light, // Change this color as needed
    ));
    final heightFullBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: widthFullBody,
        height: heightFullBody,
        child: controller.obx(
          (state) => Container(
            width: widthFullBody,
            height: heightFullBody,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back.png'),
                    fit: BoxFit.fill)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: widthFullBody,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/bg-nav.png'),
                          fit: BoxFit.fill)),
                  child: navProfil(
                    title: "Hi !",
                    subtitle: controller.username.value.toString(),
                  ),
                ),
                SizedBox(height: heightFullBody * 0.02),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(
                              0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    width: widthFullBody * 0.9,
                    child: MyInputSearch(
                      prefixIcon: Icons.search,
                      validator: controller.validator,
                      controller: controller,
                      controllerField: controller.search,
                      height: 20,
                      width: 10,
                      hintText: "Search Your Favorit Book",
                      autoFocus: false,
                    ),
                  ),
                ),
                SizedBox(height: heightFullBody * 0.02),
                MyKategori(
                  data: state!.state1!,
                ),
                Obx(
                  () => Expanded(
                    child: controller.searchLenght.value == 1
                        ? controller.loading.value == false
                            ? controller.listDataBuku.isEmpty
                                ? const Center(child: Text("Tidak Ada Buku"))
                                : BookSearch(data: controller.listDataBuku)
                            : const Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                          child: Column(
                              children: state.state2!.map((data) {
                                return SizedBox(
                                  height: heightFullBody * 0.3,
                                  child: buildSection(data: data),
                                );
                              }).toList(),
                            ),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
