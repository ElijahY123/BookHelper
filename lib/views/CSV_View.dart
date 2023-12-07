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
        title: const Text("CSV to text"),
      ),
        body: ListView(
          children: [
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
}