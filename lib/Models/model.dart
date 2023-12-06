// Selected Page Data

import 'dart:js';
import 'package:csv/csv.dart';
import 'package:flutter/cupertino.dart';

class SelectedPage {

  var selectedIndex = 0;

  void updateSelectedIndex(var newIndex){
    selectedIndex = newIndex;
  }

  getSelectedIndex()  {
    return selectedIndex;
  }

}

class CSVConverter{

  Future<List<List<dynamic>>> processCSV() async {
    var result = await DefaultAssetBundle.of(context as BuildContext).loadString(
      "assets/Amazon_Books_Data.csv",
    );
    return const CsvToListConverter().convert(result, eol: "\n");
  }

}