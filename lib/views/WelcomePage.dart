import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_d_final/views/LoginPage.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/LoginBackground2.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //SizedBox(height: 100,),
          Text(
            "CS Book Helper",
            style: GoogleFonts.shizuru(
              textStyle: const TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
          ),
          //SizedBox(height: 300,),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => loginPage()));
            },
            child: Container(
              height: 100,
              width: 380,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                child: Text(
                  "Get Started",
                  style: GoogleFonts.shizuru(
                    textStyle: const TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
