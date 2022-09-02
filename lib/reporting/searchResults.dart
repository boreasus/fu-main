// ignore_for_file: file_names

import 'package:flutter/material.dart';
//import 'package:fu_mobile/visits/visits.dart';

import '../utilities/constant.dart';

// ignore: camel_case_types
class searchResults extends StatefulWidget {
  const searchResults({Key? key}) : super(key: key);

  @override
  State<searchResults> createState() => _searchResultsState();
}

// ignore: camel_case_types
class _searchResultsState extends State<searchResults> {
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
          child: Text("Raporlama Arama Sonuçları",
              textAlign: TextAlign.center,
              style: TextStyle(color: primaryBrand)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: bgColor),
        child: Center(
          child: Column(
            children: [
              Container(
                width: 600,
                height: 50,
                decoration: BoxDecoration(color: primaryBrand),
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(24.0, 8.0, 0.0, 0.0),
                      child: Text(
                        "22.05.2022 - 23.03.2023",
                        style: TextStyle(color: headColor),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(70.0, 8.0, 0.0, 0.0),
                      child: Text(
                        "İşlem adedi: 3",
                        style: TextStyle(color: headColor),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
                    child: Container(
                      width: 380,
                      height: 90,
                      decoration: BoxDecoration(
                        color: headColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              SizedBox(
                                width: 10,
                                height: 10,
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(16.0, 5.0, 0.0, 0.0),
                                  child: Icon(Icons.radio_button_checked,
                                      color: primaryBrand),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(1.0, 10, 0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      200.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    "30.05.2022-15.30",
                                    style: TextStyle(
                                        color: primaryBrand, fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 10.0, 130.0, 0.0),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(18.0, 10.0, 30.0, 0.0),
                              child: Text(
                                "Akbank A.Ş Sinop müşterisi",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
                    child: Container(
                      width: 380,
                      height: 90,
                      decoration: BoxDecoration(
                        color: headColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              SizedBox(
                                width: 10,
                                height: 10,
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(16.0, 5.0, 0.0, 0.0),
                                  child: Icon(Icons.radio_button_checked,
                                      color: primaryBrand),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(1.0, 10, 0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      200.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    "30.05.2022-15.30",
                                    style: TextStyle(
                                        color: primaryBrand, fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 10.0, 130.0, 0.0),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(18.0, 10.0, 30.0, 0.0),
                              child: Text(
                                "Akbank A.Ş Sinop müşterisi",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
                    child: Container(
                      width: 380,
                      height: 90,
                      decoration: BoxDecoration(
                        color: headColor,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              SizedBox(
                                width: 10,
                                height: 10,
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(16.0, 5.0, 0.0, 0.0),
                                  child: Icon(Icons.radio_button_checked,
                                      color: primaryBrand),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(1.0, 10, 0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      200.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    "30.05.2022-15.30",
                                    style: TextStyle(
                                        color: primaryBrand, fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 10.0, 130.0, 0.0),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(18.0, 10.0, 30.0, 0.0),
                              child: Text(
                                "Akbank A.Ş Sinop Müşterisi",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                width: 600,
                height: 100,
                color: headColor,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: 290,
                        height: 52,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: primaryBrand,
                            ),
                            onPressed: () {
                              showAlertDialogTrue(context);
                            },
                            child: SizedBox(
                                width: 124,
                                height: 24,
                                child: Text(
                                  "Gönder",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ))),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialogTrue(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text(
      "Tamam",
      style: TextStyle(fontSize: 18, color: okColor),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    content: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: Text(
        "Adresinize e - posta Gönderilmiştir.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14),
      ),
    ),
    actions: [
      Column(
        children: [
          Container(
            width: 500,
            height: 0.5,
            color: Colors.black26,
          ),
          okButton,
        ],
      )
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
