import 'package:audioplayers/audioplayers.dart';
import 'dart:typed_data';

// Selected Page Data

class SelectedPage {

  var selectedIndex = 0;

  void updateSelectedIndex(var newIndex){
    selectedIndex = newIndex;
  }

  getSelectedIndex()  {
    return selectedIndex;
  }

}

class AudioBooksModel {
  double currentPosition = 0;
  bool pauseOrPlay = false;
  AudioPlayer player = AudioPlayer();
  List books = [
    {
      "image": "assets/Images/pythonCrashCourse.jpg",
      "title": " Python Crash Course, 3rd E...",
      "author": "Eric Matthes",
      "audio": "Images/Recording.mp3",
      "length": 12.64
    },
    {
      "image": "assets/Images/pragmaticProgrammer.jpg",
      "title": " The Pragmatic Programmer...",
      "author": "Andy Hunt and Dave Thomas",
      "audio": "Images/Recording.mp3",
      "length": 12.64
    },
    {
      "image": "assets/Images/introToAlgo.jpg",
      "title": " Introduction to Algorithms, ...",
      "author": "Thomas Cormen, Charles Leiserson",
      "audio": "Images/Recording.mp3",
      "length": 12.64
    },
    {
      "image": "assets/Images/grokking.jpg",
      "title": " Grokking Machine Learning",
      "author": "Luis Serrano",
      "audio": "Images/Recording.mp3",
      "length": 12.64
    },
    {
      "image": "assets/Images/CProgLang.jpg",
      "title": " C Programming Language, ...",
      "author": "Brian W. Kernighan",
      "audio": "Images/Recording.mp3",
      "length": 12.64
    }
  ];

  bool isAudioPlaying() {
    return pauseOrPlay;
  }

  void updateSliderValue(double value) {
    currentPosition = value;
  }

}