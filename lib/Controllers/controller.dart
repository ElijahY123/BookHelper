import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_d_final/Models/model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_d_final/views/audioBook.dart';

class CSBookController extends StatefulWidget {
  const CSBookController({super.key});

  @override
  State<CSBookController> createState() => _CSBookControllerState();
}

class _CSBookControllerState extends State<CSBookController> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // Navigation Drawer

  void openRail() {
    scaffoldKey.currentState!.openDrawer();
  }

  void closeRail() {
    Navigator.of(context).pop();
  }

  SelectedPage pageSelected = SelectedPage();

  @override
  Widget build(BuildContext context) {
    Widget? page;
    switch (pageSelected.getSelectedIndex()) {
      case 0:
        page = AudioBook();
        break;
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            leading: IconButton(onPressed: openRail, icon: Icon(Icons.menu)),
            centerTitle: true,
            title: Text(
              "CS Book Helper",
              style: GoogleFonts.bungeeShade(
                textStyle: TextStyle(
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
                    children: [
                      IconButton(onPressed: closeRail, icon: Icon(Icons.close)),
                      NavigationDrawerDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home Page'),
                      ),
                      /*NavigationDrawerDestination(
                        icon: Icon(Icons.calendar_month),
                        label: Text('Calendar Page'),
                      ),
                      NavigationDrawerDestination(
                        icon: Icon(Icons.fastfood),
                        label: Text('Calorie Counter'),
                      ),
                      NavigationDrawerDestination(
                        icon: Icon(Icons.info_outline),
                        label: Text('Workouts'),
                      ),
                      NavigationDrawerDestination(
                        icon: Icon(Icons.fitness_center),
                        label: Text("Start Workout"),
                      ),
                      NavigationDrawerDestination(
                        icon: Icon(Icons.play_arrow),
                        label: Text("Video Guides"),
                      ),
                      NavigationDrawerDestination(
                          icon: Icon(Icons.table_chart),
                          label: Text('Workout Schedule')
                      ),
                      NavigationDrawerDestination(
                        icon: Icon(Icons.message_outlined),
                        label: Text("Announcements"),
                      ),*/
                    ],
                    selectedIndex: pageSelected.getSelectedIndex(),
                    onDestinationSelected: (value) {
                      setState(() {
                        pageSelected.updateSelectedIndex(value);
                      }); //SetState
                    }, // onDestinationSelected
                  ),
                ),
              ], // children
            ),
          ),
          body: Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: page,
          ),
        );
      }, // Builder
    );
  }
}
