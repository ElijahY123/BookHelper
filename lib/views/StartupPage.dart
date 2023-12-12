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
            padding: EdgeInsets.only(top: 150),
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
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      keyboardAppearance: Brightness.dark,
                      decoration: InputDecoration(
                        label: Text(
                          "Username",
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        label: Text(
                          "Password",
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 70,),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 100,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff8d76d3),
                              Color(0xff5c53cb),
                              Color(0xff5d40ce),
                              Color(0xff4100E0),
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                              "Login",
                            style: GoogleFonts.gasoekOne(
                              color: Colors.white,
                              textStyle: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => Container()));
                        },
                        child: Text(
                          "Join Now!",
                          style: GoogleFonts.gasoekOne(
                            color: Colors.deepPurple,
                            textStyle: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
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
