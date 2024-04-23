import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:google_fonts/google_fonts.dart';

class navProfil extends StatelessWidget {
  const navProfil(
      {super.key, required this.title, this.icon, this.subtitle = ""});
  final String title;
  final String subtitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontFamily:
                  GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
              color: Colors.white,
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StrokeText(
            text: subtitle,
            textStyle: TextStyle(
                fontSize: 20,
                fontFamily:
                    GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
                color: Colors.white),
            strokeColor: Colors.black,
            strokeWidth: 2,
          ),
          StrokeText(
            text: "Mau baca buku apa hari ini?",
            textStyle: TextStyle(
                fontSize: 20,
                fontFamily:
                    GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily,
                color: Colors.white),
            strokeColor: Colors.black,
            strokeWidth: 6,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
        ],
      ),
    );
  }
}
