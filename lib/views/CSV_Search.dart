import 'package:csv/csv.dart';
import 'package:flutter/material.dart';

class CSV_Search extends StatefulWidget{

  @override
  _CSV_Search_ViewState createState() => _CSV_Search_ViewState();
}

class _CSV_Search_ViewState extends State<CSV_Search>{

  List<List<dynamic>>? csvFile;

  Future<List<List<dynamic>>> processCSV() async {
    var result = await DefaultAssetBundle.of(context).loadString(
      "assets/Amazon_Books_Data.csv",
    );
    return const CsvToListConverter().convert(result, eol: "\n");
  }

  @override
  Widget build(BuildContext context) {

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
            await showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    content: Text(
                        'you typed "$value"'
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
    obscureText: true,
    decoration: const InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Input ISBN',
    ),

    ),
      ),
    ],
    ),
    );
  }

}