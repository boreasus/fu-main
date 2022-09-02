import 'package:flutter/material.dart';
import 'package:fu_mobile/visits/resultNotification.dart';

import '../utilities/constant.dart';

// ignore: camel_case_types
class visits extends StatefulWidget {
  const visits({Key? key}) : super(key: key);

  @override
  State<visits> createState() => _visitsState();
}

// ignore: camel_case_types
class _visitsState extends State<visits> {
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
              child: Text("Ziyaretlerim",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: primaryBrand))),
        ),
      ),
      body: Container(
        color: bgColor,
        child: Column(
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
                            padding: EdgeInsets.fromLTRB(16.0, 5.0, 0.0, 0.0),
                            child: Icon(Icons.radio_button_checked,
                                color: primaryBrand),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(1.0, 10, 0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(200.0, 10.0, 0.0, 0.0),
                            child: Text(
                              "30.05.2022-15.30",
                              style:
                                  TextStyle(color: primaryBrand, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 0.0),
                          child: Text(
                            "Akbank A.Ş Sinop müşterisi",
                            style: TextStyle(fontSize: 12, color: primaryGray),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            resultNotification()));
                              },
                              icon: Icon(Icons.keyboard_arrow_right),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
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
                            padding: EdgeInsets.fromLTRB(16.0, 5.0, 0.0, 0.0),
                            child: Icon(Icons.radio_button_checked,
                                color: primaryBrand),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(1.0, 10, 0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(200.0, 10.0, 0.0, 0.0),
                            child: Text(
                              "30.05.2022-15.30",
                              style:
                                  TextStyle(color: primaryBrand, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 10.0, 100.0, 0.0),
                          child: Text(
                            "Akbank A.Ş Sinop müşterisi",
                            style: TextStyle(fontSize: 12, color: primaryGray),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            resultNotification()));
                              },
                              icon: Icon(Icons.keyboard_arrow_right),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
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
                          child: Center(
                              child: Text(
                            "Ziyaret Sonucu Bildir",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 17),
                          ))),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => visits()));
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    content: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: Text(
        "Ziyaret Sonucu Bildirildi.",
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
