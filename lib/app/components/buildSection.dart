import 'package:get/get.dart';
import 'package:readism/app/data/models/response_buku.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readism/app/routes/app_pages.dart';
import '../data/constans/constans.dart';

class buildSection extends StatelessWidget {
  const buildSection({
    super.key,
    required this.data,
  });

  final DataBuku data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.kategoriBuku.toString(),
                    style: TextStyle(
                      height: 1.2,
                      fontFamily: GoogleFonts.poppins(
                        fontWeight: FontWeight.w900,
                      ).fontFamily,
                      fontSize: 16.0,
                      color: const Color(0xff09142E),
                    ),
                  ),
                  ColoredBox(
                    color: Colors.black,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      height: 3,
                    ),
                  )
                ],
              ),
              GestureDetector(
                  onTap: () => Get.toNamed(Routes.KATEGORI, parameters: {"kategori" : data.kategoriBuku.toString()}),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: kSecondaryColor, shape: BoxShape.circle),
                    child: const FaIcon(
                      size: 15,
                      color: kPrimaryColor,
                      FontAwesomeIcons.chevronRight,
                    ),
                  )),
            ],
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFC9C9C9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.96,
            height: MediaQuery.of(context).size.height * 0.24,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: data.buku!
                    .map((e) => SizedBox(
                          width: MediaQuery.of(context).size.width * 0.28,
                          child: GestureDetector(
                            onTap: () => Get.toNamed(Routes.DETAILBOOK, parameters: {"idbook" : e.bukuID.toString()}),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 20,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      e.coverBuku.toString(),
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.26,
                                  child: Column(
                                    children: [
                                      AutoSizeText(
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        minFontSize: 12,
                                        maxFontSize: 20,
                                        e.judul.toString(),
                                        style: TextStyle(
                                          height: 1.2,
                                          fontWeight: FontWeight.w900,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 12.0,
                                          color: const Color(0xff09142E),
                                        ),
                                      ),
                                      AutoSizeText(
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        minFontSize: 12,
                                        maxFontSize: 20,
                                        "By ${e.penulis.toString()}",
                                        style: TextStyle(
                                          height: 1.2,
                                          fontWeight: FontWeight.w900,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 12.0,
                                          color: const Color(0xff09142E),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
