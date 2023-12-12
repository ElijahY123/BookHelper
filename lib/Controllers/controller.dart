import 'package:flutter/material.dart';
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
      case 2:
        page = YoutubeView(
          videoInfos: VideoRepository.videoInfos,
          onWatchYoutube: navigateToYoutubeView,
        );
        break;
      case 3:
        page = AudioBook(
          books: booksModel.books,
          player: booksModel.player,
        );
      case 4:
        page = Calendar(
          today: _calendarModel.today,
          firstDay: _calendarModel.firstDay,
          lastDay: _calendarModel.lastDay,
          onDaySelected: _calendarModel.onDaySelected,
          events: _calendarModel.events,
          eventController: _calendarModel.eventController,
          selectedEvents: _calendarModel.selectedEvents,
          getEventsForDay: _calendarModel.getEventsForDay,
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
