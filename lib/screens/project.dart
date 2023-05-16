import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'profile_body.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const url = 'https://github.com/rikopermana14';
    final Uri github = Uri.parse(url);
    projetCard(lang, title, description, star) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 220,
        child: Card(
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 30, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lang,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  description,
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.white70,
                      size: 18,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      star,
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                        onPressed: () {
                          launchUrl(github);
                        },
                        icon: Icon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                        )),
                  ],
                )
              ],
            ),
          ),
          color: Color(0xff262628),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Project',
            style: GoogleFonts.poppins(
              color: const Color(0x95484848),
              fontWeight: FontWeight.w600,
            )),
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff484848),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: 20, top: 10),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              projetCard(
                  'FLUTTER', 'Aplikasi Sederhana', 'Sekolah Vokasi Unpak', '8'),
              projetCard('WEBSITE', 'Bioskop', 'Pemesanan Tiket', '9'),
              projetCard('C++', 'Kasir', 'Pembayaran Rumah Makan', '7'),
              projetCard('Dart', 'Codelab', 'Tugas', '5'),
            ],
          ),
        ),
      ),
    );
  }
}
