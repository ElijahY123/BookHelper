import 'package:audioplayers/audioplayers.dart';
import 'package:csv/csv.dart';
import 'dart:typed_data';

// Selected Page Data
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_d_final/Models/Event.dart';
import "package:table_calendar/table_calendar.dart";


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
      "audio": "Images/PythonCrashCourse.mp3",
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

class CalendarModel {
  DateTime today = DateTime.now();
  DateTime firstDay = DateTime.now().subtract(Duration(days: 365));
  DateTime lastDay = DateTime.now().add(Duration(days: 1826));
  Map<DateTime, List<Event>> events = {};
  TextEditingController eventController = TextEditingController();
  late ValueNotifier<List<Event>> selectedEvents = ValueNotifier(getEventsForDay(today));
  String selectedItem = "";
  List<String> bookList = [];

  List<List<dynamic>>? csvFile = [];
  late List<dynamic> searchReturn;
  late String IsbnNumber;
  Uri _url = Uri.parse('https://www.kaggle.com/uzair01');

  void processCSV(context) async {
    var result = await DefaultAssetBundle.of(context).loadString(
      "assets/Amazon_Books_Data.csv",
    );
    csvFile = CsvToListConverter().convert(result, eol: "\n").toList();
    for (int i = 1; i < csvFile!.length; ++i) {
      if (csvFile?[i][0] != null)  {
        bookList.add(csvFile?[i][0]);
      }
    }
  }

  List<String> getBookList(context) {
    bookList.clear();
    processCSV(context);
    return bookList;
  }

  List<Event> getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    if (!isSameDay(today, day)) {
      today = day;
      selectedEvents.value = getEventsForDay(day);
    }
  }
}