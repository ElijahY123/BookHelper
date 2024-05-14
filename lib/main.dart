import 'package:flutter/material.dart';
import 'package:group_d_final/views/WelcomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:group_d_final/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.hasError) { print("Couldn't Connect"); }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Fitness App',
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              ),
              home: const welcomePage(),
            );
          }
          Widget loading= const MaterialApp();
          return loading;
        }
    );


  }
}