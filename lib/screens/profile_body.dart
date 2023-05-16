import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:utp/screens/maroon.dart';
import 'package:utp/screens/student.dart';

class ProfileBodyScreen extends StatelessWidget {
  const ProfileBodyScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _baseUrl =
        'https://prak-labkom-mobpro.000webhostapp.com/api/students';
    const url = 'https://github.com/rikopermana14';
    final Uri github = Uri.parse(url);
    final Uri whatsapp = Uri.parse('https://wa.me/62895110014498');
    final Uri youtube =
        Uri.parse('https://www.youtube.com/channel/UCKicbyzjXIX7zaeXLaFelvA');

    final List<String> tags = [
      'PHP',
      'Laravel',
      'HTML',
      'Website',
      'Flutter',
      'CSS',
      'C++',
    ];
    var Textcard = GoogleFonts.poppins(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.normal,
    );
    var drop = GoogleFonts.poppins(
      fontSize: 12,
      color: const Color(0xff484848),
      fontWeight: FontWeight.normal,
    );
    var dropgrey = GoogleFonts.poppins(
      fontSize: 12,
      color: const Color(0xff484848),
      fontWeight: FontWeight.w600,
    );
    var bold = GoogleFonts.poppins(
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(1),
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15,
                        offset: Offset(0, 4))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Color.fromARGB(255, 48, 28, 4)),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/foto.jpeg'),
                radius: 50,
              ),
            ),
            Spacer(),
            Text(
              'Riko Permana',
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: const Color(0xff484848),
              ),
            ),
            Text(
              '065120032@student.unpak.ac.id',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xff8B8B8B),
              ),
            ),
            Text(
              '0895110014498',
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: const Color(0xff8B8B8B),
              ),
            ),
            Spacer(),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 56, 34, 8),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              margin: const EdgeInsets.only(left: 20, right: 20),
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      'NPM',
                      style: Textcard,
                    ),
                    const Spacer(),
                    Text(
                      '065120032',
                      style: bold,
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.white,
                ),
                Row(
                  children: [
                    Text(
                      'Kelas',
                      style: Textcard,
                    ),
                    const Spacer(),
                    Text(
                      '6B',
                      style: bold,
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.white,
                ),
                Row(
                  children: [
                    Text(
                      'Fakultas',
                      style: Textcard,
                    ),
                    const Spacer(),
                    Text(
                      'MIPA',
                      style: bold,
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.white,
                ),
                Row(
                  children: [
                    Text(
                      'Program Studi',
                      style: Textcard,
                    ),
                    const Spacer(),
                    Text(
                      'Ilmu Komputer',
                      style: bold,
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.white,
                ),
                Row(
                  children: [
                    Text(
                      'Pendidikan',
                      style: Textcard,
                    ),
                    const Spacer(),
                    Text(
                      'S1 Universitas Pakuan',
                      style: bold,
                    ),
                  ],
                ),
              ]),
            ),
            Spacer(),
            Container(
                margin: EdgeInsets.only(top: 25),
                height: 45,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: tags.length,
                    itemBuilder: (BuildContext contect, int index) {
                      return Container(
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.lightBlueAccent,
                                    Colors.orangeAccent
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight)),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              tags[index],
                              style: TextStyle(color: Colors.white),
                            ),
                          ));
                    })),
            Spacer(),
            Container(
              margin: EdgeInsets.only(top: 25),
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: const Text('Student API'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffEE8301),
                  minimumSize: const Size(310, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  )),
                  textStyle: GoogleFonts.poppins(fontSize: 14),
                ),
              ),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.only(top: 25),
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MaroonScreen()),
                  );
                },
                child: const Text('Maroon API'),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffEE8301),
                  minimumSize: const Size(310, 40),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  )),
                  textStyle: GoogleFonts.poppins(fontSize: 14),
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        launchUrl(github);
                      },
                      icon: Icon(
                        FontAwesomeIcons.github,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {
                        launchUrl(whatsapp);
                      },
                      icon: Icon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.black,
                      )),
                  IconButton(
                      onPressed: () {
                        launchUrl(youtube);
                      },
                      icon: Icon(
                        FontAwesomeIcons.youtube,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
