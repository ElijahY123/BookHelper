import 'package:csv/csv.dart';
import 'package:flutter/material.dart';

class CSV_Search extends StatefulWidget{

  @override
  _CSV_Search_ViewState createState() => _CSV_Search_ViewState();
}

class _CSV_Search_ViewState extends State<CSV_Search>{

  late Future<List<List<dynamic>>> csvFile;

  Future<List<List<dynamic>>> processCSV() async {
    var result = await DefaultAssetBundle.of(context).loadString(
      "assets/Amazon_Books_Data.csv",
    );
    return const CsvToListConverter().convert(result, eol: "\n");
  }

  List<List<dynamic>> searchedItem = [];
  int size = 0;


  @override
  Widget build(BuildContext context) {
    csvFile = processCSV();
    //searchedItem.add([0,1,2]);
    //size = searchedItem.first.length;

    return Scaffold(
        appBar: AppBar(
        title: const Text("Search List"),
    ),
    body: ListView(
    children:  [
      SizedBox(
        width: 250,
        child: TextField(
          onSubmitted: (String value) async{
            searchedItem.add(searchCsvValue(csvFile, value));
            size = searchedItem.first.length;
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    content: Text(
                        'you typed "$value" '
                    ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              }
            );
          },
    obscureText: false,
    decoration: const InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Input ISBN',
    ),

    ),
      ),

      Text(
        '$size'
      ),
    ],
    ),
    );
  }

}

List<List> searchCsvValue(Future<List<List<dynamic>>> csvFile, String searchValue){
  List<List<dynamic>> result = [];
  
  for(int i = 0; i < csvFile.toString().length; ++i){
   if(csvFile.toString().contains(searchValue, 0)) {
     result = csvFile.toString().indexOf(searchValue) as List<List>;
   }
  }
    //if(csvFile.toString().){
      //result.add(searchCsvValue(csvFile, searchValue));
    //}

  return result;
}