import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_d_final/Models/model.dart';

AudioBooksModel booksModel = AudioBooksModel();

class AudioBook extends StatelessWidget {
  const AudioBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
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
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30, right: 30),
                                child: Container(
                                          height: 45,
                                          width: MediaQuery.of(context).size.width - 60,
                                          decoration: const BoxDecoration(
                                             border: Border(
                                                bottom: BorderSide(
                                                color: Colors.white,
                                                width: 1.5
                                                )
                                              ),
                                          ),
                                          child: Text(
                                            "Audio Books",
                                            style: GoogleFonts.aBeeZee(
                                              textStyle: const TextStyle(
                                                fontSize: 30,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                          ),
                              )
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                            child: Column(
                              children: List.generate(booksModel.books.length, (index) {
                                return Padding(
                                    padding: const EdgeInsets.only(left: 30, right: 30, bottom: 25),
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
                                            //border: Border.all(color: Colors.white)
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width - 350,
                                                height: 70,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                        booksModel.books[index]['image'],
                                                      )
                                                  )
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    booksModel.books[index]['title'],
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                  Text(
                                                    booksModel.books[index]['author'],
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white54,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                    textAlign: TextAlign.left
                                                  ),
                                                ],
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
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "** Tap on an Audio Book To Listen **",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
        )
    );
  }

}