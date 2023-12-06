import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_d_final/Models/model.dart';

class CSV_View extends StatelessWidget{
  CSV_View({super.key});

  List<List<dynamic>>? csvFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CSV to text"),
      ),

    );
  }

}