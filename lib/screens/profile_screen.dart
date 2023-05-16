import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
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
      body: const ProfileBodyScreen(),
    );
  }
}
