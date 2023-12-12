import 'package:audioplayers/audioplayers.dart';

// Selected Page Data
import 'package:flutter/cupertino.dart';
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
  DateTime firstDay = DateTime.now().subtract(const Duration(days: 365));
  DateTime lastDay = DateTime.now().add(const Duration(days: 1826));
  Map<DateTime, List<Event>> events = {};
  TextEditingController eventController = TextEditingController();
  late ValueNotifier<List<Event>> selectedEvents = ValueNotifier(getEventsForDay(today));

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