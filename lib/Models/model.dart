import 'package:audioplayers/audioplayers.dart';
import 'package:csv/csv.dart';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:group_d_final/Controllers/controller.dart';
import 'dart:async';

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
  bool eventsLoaded = false;
  Map<DateTime, List<Event>> firstLoadEvents = {};

  late Timer timer = Timer.periodic(Duration(seconds: 2), (Timer t) => loadDatabase());

  List<List<dynamic>>? csvFile = [];
  late List<dynamic> searchReturn;
  late String IsbnNumber;
  Uri _url = Uri.parse('https://www.kaggle.com/uzair01');

  final accountsRef = FirebaseFirestore.instance.collection('Accounts');

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
    loadDatabase();
    DateTime date = DateTime(day.year, day.month, day.day, 0, 0, 0, 0, 0);
    return events[date] ?? [];
  }

  void onDaySelected(DateTime day, DateTime focusedDay) {
    if (!isSameDay(today, day)) {
      today = day;
      selectedEvents.value = getEventsForDay(day);
    }
  }

  void loadDatabase() {
    if (!eventsLoaded) {
      updateEventsFromDatabase();
    }
    eventsLoaded = true;
  }

  void updateEventsFromDatabase() {
    print("updated");
    events.clear();
    accountsRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        accountsRef.doc(doc.id).get().then((DocumentSnapshot doc) {
          final eventsRef = FirebaseFirestore.instance.collection('Accounts').doc(doc.id).collection("Events");
          eventsRef.get().then((QuerySnapshot snapshot) {
            snapshot.docs.forEach((DocumentSnapshot doc2) {
              eventsRef.doc(doc2.id).get().then((DocumentSnapshot doc2) {
                Timestamp temp = doc2.get("Day");
                DateTime dbDay = temp.toDate();
                String title = doc2.get("Title");

                dbDay = DateTime(dbDay.year, dbDay.month, dbDay.day, 0, 0, 0, 0, 0);
                if (events[dbDay] != null) {
                  events[dbDay]?.add(Event(title));
                }
                events.putIfAbsent(dbDay, () => [Event(title)]);
              });
            });
          });
        });
      });
    });
  }

  /**
   * Searhes Firebase for Username and stores events in a subcollection Events
   * in collection Accounts.
   * @author: Elijah Yeboah
   * @param: Username - Takes in a string username.
   * @param: SelectedItem - Takes in a string selectedItem which is whatever the event is.
   * @return: none
   */
  void addEvent(String username, String selectedItem, DateTime today) {
    accountsRef.get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((DocumentSnapshot doc) {
        accountsRef.doc(doc.id).get().then((DocumentSnapshot doc) {
          if (username == doc['Username']) {
            FirebaseFirestore.instance.collection('Accounts').doc(doc.id)
                .collection('Events').add({
              'Day': today.add(Duration(days: 1)),
              'Title': selectedItem,
            });
          }
        });
      });
    });
  }
}


class AccountModel {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  String get userName => usernameController.text.trim();
  String get passWord => passwordController.text.trim();
  String get confirmPassword => confirmController.text.trim();

  final accountsRef = FirebaseFirestore.instance.collection('Accounts');

  String error = " ";

  /**
   * Checks the Firestore Database for a Username and Password created.
   * @author: Elijah Yeboah
   * @param: Context - Navigates to the functions of the app if successful.
   * @return: none
   */
  void retrieveLoginInfo(BuildContext context) async {
    if (userName.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.deepPurple,
        content: Text("No username has been entered"),
      ));
    } else if (passWord.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.deepPurple,
        content: Text("No password has been entered"),
      ));
    } else {
      accountsRef.get().then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((DocumentSnapshot doc) {
          accountsRef.doc(doc.id).get().then((DocumentSnapshot doc) {
            try {
              if (userName == doc['Username'] && passWord == doc['Password']) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CSBookController(username: userName, password: passWord,)));
              } else if (userName == doc['Username'] &&
                  passWord != doc['Password']) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.deepPurple,
                  content: Text("Invalid Password"),
                ));
              } else if (userName != doc['Username'] &&
                  passWord == doc['Password']) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.deepPurple,
                  content: Text("Invalid Username"),
                ));
              }
            } catch (e) {
              String error = " ";
              if (e.toString() ==
                  "RangeError (index): Invalid value: Valid value range is empty: 0") {
                error = "Invalid Username";
              } else {
                error = "Invalid Password";
              }
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.deepPurple,
                content: Text(error),
              ));
            }
          });
        });
      });
    }
  }

  /**
   * Adds username and password to collection Accounts on Firebase.
   * @author: Elijah Yeboah
   * @param: Username - Takes in a string username.
   * @param: Password - Takes in a string password.
   * @return: none
   */
  void addAccount(String userName, String passWord) {
    FirebaseFirestore.instance.collection('Accounts').add({
      'Username': userName,
      'Password': passWord,
    });
  }

}