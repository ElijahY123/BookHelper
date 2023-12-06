// Selected Page Data

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
