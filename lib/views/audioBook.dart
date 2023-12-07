import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AudioBook extends StatelessWidget {
  const AudioBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ListView(
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/Images/audioBanner.jpg",
                                ),
                              fit: BoxFit.cover
                            ),
                          ),
                          child: Center(
                            child:  Text(
                            "Audio Books",
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  fontSize: 70,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SingleChildScrollView(
                            child: Column(
                              children: List.generate(5, (index) {
                                return Padding(
                                    padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width - 60,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(color: Colors.white)
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width - 350,
                                                height: 70,
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              const Column(
                                                children: [
                                                  Text(
                                                    "CS Book Title",
                                                    style: TextStyle(
                                                      fontSize: 27,
                                                      color: Colors.white
                                                    ),
                                                  ),
                                                  Text(
                                                    "  Tyler the Creater, Asap Rocky",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              ),
                            ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
        )
      ),
    );
  }

}