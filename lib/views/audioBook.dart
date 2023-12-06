import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AudioBook extends StatelessWidget {
  const AudioBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Select an AudioBook",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
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
                            color: Colors.lightBlue,
                          ),
                          child: const Center(
                            child:  Text(
                              //replace with something that looks nicer
                            "Audio Books",
                              style: TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SingleChildScrollView(
                            child: Column(
                              children: List.generate(10, (index) {
                                return Padding(
                                    padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width - 60,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                          ),
                                        )
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