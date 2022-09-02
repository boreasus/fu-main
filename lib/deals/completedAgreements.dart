// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../utilities/constant.dart';

// ignore: camel_case_types
class completedAgreements extends StatefulWidget {
  const completedAgreements({Key? key}) : super(key: key);

  @override
  State<completedAgreements> createState() => _completedAgreementsState();
}

// ignore: camel_case_types
class _completedAgreementsState extends State<completedAgreements> {
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
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 50.0, 0.0),
          child: Center(
              child: Text("Tamamlanan Mutabakatlarım",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: primaryBrand))),
        ),
      ),
      body: Container(
        color: bgColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
              child: Container(
                width: 500,
                height: 300,
                decoration: BoxDecoration(color: headColor),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 0.0),
                            child: Text(
                              "Dönem",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(130.0, 20.0, 0.0, 0.0),
                            child: Text(
                              "31.07.2022-01.08.2023",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: 360,
                          height: 1,
                          color: primaryGray,
                        ),
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
                            child: Text(
                              "İşlem Sayısı",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(100.0, 10.0, 0.0, 0.0),
                            child: Text(
                              "24",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: 360,
                          height: 1,
                          color: primaryGray,
                        ),
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
                            child: Text(
                              "Brüt Tutar",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(110.0, 10.0, 0.0, 0.0),
                            child: Text(
                              "1937,5",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: 360,
                          height: 1,
                          color: primaryGray,
                        ),
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
                            child: Text(
                              "Stopaj",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(140.0, 10.0, 0.0, 0.0),
                            child: Text(
                              "387",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: 360,
                          height: 1,
                          color: primaryGray,
                        ),
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
                            child: Text(
                              "KDV",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(155.0, 10.0, 0.0, 0.0),
                            child: Text(
                              "387",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: 360,
                          height: 1,
                          color: primaryGray,
                        ),
                      ),
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
                            child: Text(
                              "Toplam Alacak",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(80.0, 10.0, 0.0, 0.0),
                            child: Text(
                              "1550000",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: 360,
                          height: 1,
                          color: primaryGray,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
