import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  String username;
  String password;

  Profile({
    required this.username,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Icon(
            Icons.person,
            size: 200,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Username: $username",
            style: GoogleFonts.shizuru(
                color: Colors.white,
                textStyle: TextStyle(
                  fontSize: 30,
                )),
            textAlign: TextAlign.center,
          ),
          Text(
            "Password: $password",
            style: GoogleFonts.shizuru(
                color: Colors.white,
                textStyle: TextStyle(
                  fontSize: 30,
                )),
            textAlign: TextAlign.center,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Sign Out"),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
