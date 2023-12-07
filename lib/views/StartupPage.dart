import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class accountHandling extends StatefulWidget {
  const accountHandling({super.key});

  @override
  State<accountHandling> createState() => _accountLogin();
  State<accountHandling> createState2() => _accountCreate();
}

class _accountLogin extends State<accountHandling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff8d76d3),
                  Color(0xff5c53cb),
                  Color(0xff5d40ce),
                  Color(0xff4100E0),
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 60.0,
                left: 22,
              ),
              child: Text(
                "Welcome",
                style: GoogleFonts.gasoekOne(
                  textStyle: TextStyle(fontSize: 50, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 200),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  TextField(

                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _accountCreate extends State<accountHandling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
