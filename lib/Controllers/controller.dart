import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:group_d_final/Models/model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_d_final/views/Profile.dart';
import 'package:group_d_final/views/audioBook.dart';
import 'package:group_d_final/views/Calendar.dart';
import '../views/CSV_View.dart';
import '../Models/VideoRepository.dart';
import '../views/YoutubeView.dart';

class CSBookController extends StatefulWidget {
  const CSBookController({super.key});

  @override
  State<CSBookController> createState() => _CSBookControllerState();
}

class _CSBookControllerState extends State<CSBookController> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final CalendarModel _calendarModel = CalendarModel();
  AudioBooksModel booksModel = AudioBooksModel();
  AccountModel accountModel = AccountModel();

  // Navigation Drawer

  void openRail() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeRail() {
    Navigator.of(context).pop();
  }

  void navigateToYoutubeView(List<VideoInfo> videoInfos) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YoutubeView(
            videoInfos: videoInfos, onWatchYoutube: navigateToYoutubeView),
      ),
    );
  }

  // Calendar
  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      _calendarModel.onDaySelected(day, focusedDay);
    });
  }

/*
  void processCSV(context) {
    setState(() {
      processCSV(context);
    });
  }
 */

  onDropDownChanged(String? item) {
        (item) => setState(() => _calendarModel.selectedItem = item);
  }

  SelectedPage pageSelected = SelectedPage();

  @override
  Widget build(BuildContext context) {
    Widget? page;
    switch (pageSelected.getSelectedIndex()) {
      case 0:
        page = Profile(
            username: accountModel.userName,
            password: accountModel.passWord,
        );
        break;
      case 1:
        page = const CSV_View();
        break;

      case 3:
        page = YoutubeView(
          videoInfos: VideoRepository.videoInfos,
          onWatchYoutube: navigateToYoutubeView,
        );
        break;
      case 4:
        page = AudioBook(
          books: booksModel.books,
          player: booksModel.player,
        );
      case 5:
        page = Calendar(
          today: _calendarModel.today,
          firstDay: _calendarModel.firstDay,
          lastDay: _calendarModel.lastDay,
          onDaySelected: onDaySelected,
          events: _calendarModel.events,
          eventController: _calendarModel.eventController,
          selectedEvents: _calendarModel.selectedEvents,
          getEventsForDay: _calendarModel.getEventsForDay,
          selectedItem: _calendarModel.selectedItem,
          bookList: _calendarModel.bookList,
          onDropDownChanged: onDropDownChanged,
          processCSV: _calendarModel.processCSV,
          getBookList: _calendarModel.getBookList,
        );
        break;
      default:
        throw UnimplementedError('No page for selected page');
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
                onPressed: openRail, icon: const Icon(Icons.menu)),
            centerTitle: true,
            title: Text(
              "CS Book Helper",
              style: GoogleFonts.bungeeShade(
                textStyle: const TextStyle(
                  fontSize: 31,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          drawer: Drawer(
            child: Row(
              children: [
                SafeArea(
                  child: NavigationDrawer(
                    selectedIndex: pageSelected.getSelectedIndex(),
                    onDestinationSelected: (value) {
                      setState(() {
                        pageSelected.updateSelectedIndex(value);
                      }); //SetState
                    },
                    children: [
                      IconButton(
                          onPressed: closeRail, icon: const Icon(Icons.close)),
                      const NavigationDrawerDestination(
                        icon: Icon(Icons.person),
                        label: Text('Profile'),
                      ),
                      const NavigationDrawerDestination(
                        icon: Icon(Icons.table_chart),
                        label: Text('CSV Display'),
                      ),
                      const NavigationDrawerDestination(
                        icon: Icon(Icons.play_arrow),
                        label: Text("Video Guides"),
                      ),
                      const NavigationDrawerDestination(
                        icon: Icon(Icons.headphones),
                        label: Text('Audio Books'),
                      ),
                      const NavigationDrawerDestination(
                        icon: Icon(Icons.calendar_month_outlined),
                        label: Text('Calendar'),
                      ),
                      /*
                      NavigationDrawerDestination(
                        icon: Icon(Icons.fitness_center),
                        label: Text("Start Workout"),
                      ),
                      NavigationDrawerDestination(
                          icon: Icon(Icons.table_chart),
                          label: Text('Workout Schedule')
                      ),
                      NavigationDrawerDestination(
                        icon: Icon(Icons.message_outlined),
                        label: Text("Announcements"),
                      ),
                       */
                    ], // onDestinationSelected
                  ),
                ),
              ], // children
            ),
          ),
          body: Container(
            color: Theme
                .of(context)
                .colorScheme
                .primaryContainer,
            child: page,
          ),
        );
      }, // Builder
    );
  }
}