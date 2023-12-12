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
                    searchTextConvert(searchReturn);
                    await showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(
                                'you typed "$IsbnNumber"\n'
                                    '\n'
                                    'Book Title: "$bookTitle" \n'
                                    '\n'
                                    'Book Description: "$bookDescription" \n'
                                    '\n'
                                    'Book Author: "$bookAuthor" \n'
                                    '\n'
                                    'Book ISBN 10: "$bookISBN10" \n'
                                    '\n'
                                    'Book ISBN 13: "$bookISBN13" \n'
                                    '\n'
                                    'Book Publish Date: "$bookPublishDate" \n'
                                    '\n'
                                    'Book Edition: "$bookEdition" \n'
                                    '\n'
                                    'Book Best Seller: "$bookBestSeller" \n'
                                    '\n'
                                    'Book Top Rated: "$bookTopRated" \n'
                                    '\n'
                                    'Book Rating: "$bookRating" \n'
                                    '\n'
                                    'Book Review Count: "$bookReviewCount" \n'
                                    '\n'
                                    'Book Price: "$bookPrice" \n'
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

    void searchTextConvert(List<dynamic> searchResult){
      bookTitle = searchResult[0].toString();
      bookDescription = searchResult[1].toString();
      bookAuthor = searchResult[2].toString();
      bookISBN10 = searchResult[3].toString();
      bookISBN13 = searchResult[4].toString();
      bookPublishDate = searchResult[5].toString();
      bookEdition = searchResult[6].toString();
      bookBestSeller = searchResult[7].toString();
      bookTopRated = searchResult[8].toString();
      bookRating = searchResult[9].toString();
      bookReviewCount = searchResult[10].toString();
      bookPrice = searchResult[11].toString();
    }

}
