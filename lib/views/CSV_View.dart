import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
//import 'package:group_d_final/Models/model.dart';

class CSV_View extends StatefulWidget {
  const CSV_View({super.key});

  @override
  _CSV_ViewState createState() => _CSV_ViewState();
}


class _CSV_ViewState extends State<CSV_View>{

  List<List<dynamic>>? csvFile;
  late List<dynamic> searchReturn;
  late String IsbnNumber;

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
        title: const Text("CSV to text and search"),
      ),
        body: ListView(
          children: [
            SizedBox(
              width: 250,
              child: TextField(
                onSubmitted: (String value) async{
                  IsbnNumber = value;
                  searchReturn = searchCSV(csvFile, IsbnNumber);
                  await showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text(
                              'you typed "$IsbnNumber" book return "$searchReturn" '
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
            const Padding(padding: EdgeInsets.all(8)),
        SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: csvFile == null
                  ? const CircularProgressIndicator()
                  : DataTable(
                columns: csvFile![0]
                    .map(
                      (item) => DataColumn(
                    label: Text(
                      item.toString(),
                    ),
                  ),
                )
                    .toList(),
                rows: csvFile!
                    .map(
                      (csvrow) => DataRow(
                    cells: csvrow
                        .map(
                          (csvItem) => DataCell(
                        Text(
                          csvItem.toString(),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                )
                    .toList(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            csvFile = await processCSV();
            setState(() {});
          },
        ),
      );
    }

   searchCSV(List<List<dynamic>>? csvFile, String Isbnnumber){

    for(int i = 0; i < csvFile!.length; ++i){
      if(csvFile[i].contains(Isbnnumber)){
        return csvFile[i];
      }
    }

    }
}
