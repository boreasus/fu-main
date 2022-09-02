// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../utilities/constant.dart';

// ignore: camel_case_types
class deedTransactions extends StatefulWidget {
  const deedTransactions({Key? key}) : super(key: key);
  @override
  State<deedTransactions> createState() => _deedTransactionsState();
}

// ignore: camel_case_types
class _deedTransactionsState extends State<deedTransactions> {
  var bankalar = ["Akbank", "garanti", "ziraat", "ptt", "Qnb"];
  var subeAdi = ["ankara", "karşıyaka", "istanbul", "üsküdar", "maltepe"];
  var islemAdedi = [1, 2, 3, 4, 5];
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  TextStyle headerTextStyle = TextStyle(color: Colors.white, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: headColor,
          title: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Text("Aylık Tapu İşlem Adetleri\nÖnceki Yıl",
                textAlign: TextAlign.center,
                style: TextStyle(color: primaryBrand)),
          ),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                  child: SizedBox(
                    width: 330,
                    child: Table(
                      border: TableBorder.all(color: bgColor),
                      children: [
                        TableRow(
                          children: <Widget>[
                            Container(
                              height: 50,
                              color: primaryBrand,
                              child: Center(
                                  child: Text(
                                "Banka Adı",
                                textAlign: TextAlign.center,
                              )),
                            ),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.top,
                              child: Container(
                                height: 50,
                                width: 32,
                                color: primaryBrand,
                                child: Center(
                                    child: Text(
                                  "Şube Adı",
                                  textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                            Container(
                              height: 50,
                              color: primaryBrand,
                              child: Center(
                                  child: Text(
                                "İşlem Adedi\n(Geçen yıl aynı ay)",
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                              height: 30,
                              color: headColor,
                              child: Center(
                                  child: Text(
                                "Ziraat",
                                textAlign: TextAlign.center,
                              )),
                            ),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.top,
                              child: Container(
                                height: 30,
                                width: 32,
                                color: headColor,
                                child: Center(
                                    child: Text(
                                  "Üsküdar",
                                  textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                            Container(
                              height: 30,
                              color: headColor,
                              child: Center(
                                  child: Text(
                                "3",
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                              height: 30,
                              color: primaryBrand,
                              child: Center(
                                  child: Text(
                                "Ziraat",
                                textAlign: TextAlign.center,
                              )),
                            ),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.top,
                              child: Container(
                                height: 30,
                                width: 32,
                                color: primaryBrand,
                                child: Center(
                                    child: Text(
                                  "Üsküdar",
                                  textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                            Container(
                              height: 30,
                              color: primaryBrand,
                              child: Center(
                                  child: Text(
                                "3",
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                              height: 30,
                              color: headColor,
                              child: Center(
                                  child: Text(
                                "Ziraat",
                                textAlign: TextAlign.center,
                              )),
                            ),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.top,
                              child: Container(
                                height: 30,
                                width: 32,
                                color: headColor,
                                child: Center(
                                    child: Text(
                                  "Üsküdar",
                                  textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                            Container(
                              height: 30,
                              color: headColor,
                              child: Center(
                                  child: Text(
                                "3",
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                              height: 30,
                              color: primaryBrand,
                              child: Center(
                                  child: Text(
                                "Ziraat",
                                textAlign: TextAlign.center,
                              )),
                            ),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.top,
                              child: Container(
                                height: 30,
                                width: 32,
                                color: primaryBrand,
                                child: Center(
                                    child: Text(
                                  "Üsküdar",
                                  textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                            Container(
                              height: 30,
                              color: primaryBrand,
                              child: Center(
                                  child: Text(
                                "3",
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ],
                        ),
                        TableRow(
                          children: <Widget>[
                            Container(
                              height: 30,
                              color: headColor,
                              child: Center(
                                  child: Text(
                                "Ziraat",
                                textAlign: TextAlign.center,
                              )),
                            ),
                            TableCell(
                              verticalAlignment: TableCellVerticalAlignment.top,
                              child: Container(
                                height: 30,
                                width: 32,
                                color: headColor,
                                child: Center(
                                    child: Text(
                                  "Üsküdar",
                                  textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                            Container(
                              height: 30,
                              color: headColor,
                              child: Center(
                                  child: Text(
                                "3",
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
