import 'package:flutter/material.dart';
import 'package:group_d_final/Models/model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_d_final/views/audioBook.dart';
import '../views/CSV_View.dart';

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
        page = const AudioBook();
        break;
      case 1:
        page = const CSV_View();
        break;
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            leading: IconButton(onPressed: openRail, icon: const Icon(Icons.menu)),
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
                      IconButton(onPressed: closeRail, icon: const Icon(Icons.close)),
                      const NavigationDrawerDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home Page'),
                      ),
                      const NavigationDrawerDestination(
                        icon: Icon(Icons.table_chart),
                        label: Text('CSV Display'),
                      ),
                      /*NavigationDrawerDestination(
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
                    ], // onDestinationSelected
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
