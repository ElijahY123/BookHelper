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
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/Images/welcomeBackground.jpg",
                        //Citation: Luminous Efficiency PNG Image, Luminous Efficiency Of Digital Technology, Line, Science And Technology, Blu Ray PNG Image For Free Download: Digital technology, Computer technology, Science and technology. (2018). Retrieved from https://www.pinterest.com/pin/556616835188691710/
                      ),
                    fit: BoxFit.fill
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height-750,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                ),
                child: Center(
                  child: Text(
                    "CS Book Helper",
                    style: GoogleFonts.aBeeZee(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 5
                  ),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height-550,
                    ),
                    SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Learn, \nApply, \nCreate",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontSize: 70,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const loginPage()));
                        },
                        child: Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: Center(
                            child: Text(
                              "Get Started",
                              style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Colors.black
                              ),
                            ),
                          )
                        )
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
