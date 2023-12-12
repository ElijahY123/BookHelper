import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CSV_View extends StatefulWidget {
  const CSV_View({super.key});

  @override
  _CSV_ViewState createState() => _CSV_ViewState();
}


class _CSV_ViewState extends State<CSV_View>{

  List<List<dynamic>>? csvFile;
  late List<dynamic> searchReturn;
  late String IsbnNumber;
  late String bookTitle;
  late String bookDescription;
  late String bookAuthor;
  late String bookISBN10;
  late String bookISBN13;
  late String bookPublishDate;
  late String bookEdition;
  late String bookBestSeller;
  late String bookTopRated;
  late String bookRating;
  late String bookReviewCount;
  late String bookPrice;
  final Uri _url = Uri.parse('https://www.kaggle.com/uzair01');

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: _launchUrl,
                  child: const Text('Source for CSV of CS Books.')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250,
                child: TextField(
                  onSubmitted: (String value) async{
                    IsbnNumber = value;
                    searchReturn = searchCSV(csvFile, IsbnNumber);
                    bookTitle = searchReturn[0];
                    bookDescription = searchReturn[1];
                    bookAuthor = searchReturn[2];
                    bookISBN10 = searchReturn[3];
                    bookISBN13 = searchReturn[4];
                    bookPublishDate = searchReturn[5];
                    bookEdition = searchReturn[6];
                    bookBestSeller = searchReturn[7];
                    bookTopRated = searchReturn[8];
                    bookRating = searchReturn[9];
                    bookReviewCount = searchReturn[10];
                    bookPrice = searchReturn[11];
                    await showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(
                                'you typed "$IsbnNumber"\n'
                                    'Row Return: $searchReturn \n'
                                    'Book Title: $bookTitle \n '
                                    'Book Description: $bookDescription \n'
                                    'Book Author: $bookAuthor \n'
                                    'Book ISBN 10: $bookISBN10 \n'
                                    'Book ISBN 13: $bookISBN13 \n'
                                    'Book Publish Date: $bookPublishDate \n'
                                    'Book Edition: $bookEdition \n'
                                    'Book Best Seller: $bookBestSeller \n'
                                    'Book Top Rated: $bookTopRated \n'
                                    'Book Rating: $bookRating \n'
                                    'Book Review Count: $bookReviewCount \n'
                                    'Book Price: $bookPrice \n'
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
                    labelText: 'Input ISBN or Book Title',
                  ),
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

    Future<void> _launchUrl() async {
    if(!await launchUrl(_url)){
      throw Exception('Could not Launch URL: $_url ');
    }
    }
}
