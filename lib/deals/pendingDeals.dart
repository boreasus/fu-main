// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utilities/constant.dart';

// ignore: camel_case_types
class pendingDeals extends StatefulWidget {
  const pendingDeals({Key? key}) : super(key: key);

  @override
  State<pendingDeals> createState() => _pendingDealsState();
}

// ignore: camel_case_types
class _pendingDealsState extends State<pendingDeals> {
  TextEditingController dateinput = TextEditingController();

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
              child: Text("Bekleyen Mutabakatlarım",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: primaryBrand))),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: bgColor,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
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
                              padding:
                                  EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 0.0),
                              child: Text(
                                "Dönem",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(130.0, 20.0, 0.0, 0.0),
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
                              padding:
                                  EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
                              child: Text(
                                "İşlem Sayısı",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(100.0, 10.0, 0.0, 0.0),
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
                              padding:
                                  EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
                              child: Text(
                                "Brüt Tutar",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(110.0, 10.0, 0.0, 0.0),
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
                              padding:
                                  EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
                              child: Text(
                                "Stopaj",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(140.0, 10.0, 0.0, 0.0),
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
                              padding:
                                  EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
                              child: Text(
                                "KDV",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(155.0, 10.0, 0.0, 0.0),
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
                              padding:
                                  EdgeInsets.fromLTRB(30.0, 10.0, 0.0, 0.0),
                              child: Text(
                                "Toplam Alacak",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.fromLTRB(80.0, 10.0, 0.0, 0.0),
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
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 25.0, 270, 5.0),
                child: Text(
                  "Makbuz Tarihi",
                  style: TextStyle(color: primaryGray, fontSize: 14),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: headColor,
                    border: Border.all(color: primaryGray)),
                width: 360,
                height: 50,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 0.0, 0, 0),
                      child: SizedBox(
                        width: 300,
                        height: 40,
                        child: TextField(
                          controller: dateinput,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.calendar_today,
                                color: primaryBrand,
                              ),
                              hintText: "Tarih Seçiniz",
                              hintStyle: TextStyle(color: primaryGray)),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101));
                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);

                              setState(() {
                                dateinput.text = formattedDate;
                              });
                            } else {}
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 25.0, 280, 0.0),
                child: Text(
                  "Makbuz No",
                  style: TextStyle(color: primaryGray, fontSize: 14),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                child: Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryGray),
                      borderRadius: BorderRadius.circular(5),
                      color: headColor),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: SizedBox(
                      width: 300,
                      height: 30,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Makbuz No Giriniz",
                            hintStyle: TextStyle(color: primaryGray)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 25.0, 280, 0.0),
                child: Text(
                  "Makbuz Ekle",
                  style: TextStyle(color: primaryGray, fontSize: 14),
                ),
              ),
              SizedBox(
                width: 350,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: primaryBrand),
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                      child: Row(
                        children: const [
                          Icon(Icons.camera_alt),
                          Padding(
                            padding: EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 0.0),
                            child: Text(
                              "Fotoğraf çek",
                              style: TextStyle(fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 40.0),
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: primaryBrand)),
                  child: SizedBox(
                    width: 350,
                    height: 40,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: bgColor,
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.browse_gallery_sharp,
                                color: primaryBrand,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  "Galeriden Seç",
                                  style: TextStyle(
                                      fontSize: 20, color: primaryBrand),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ),
              ),
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
                              "Gönder",
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
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    content: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: Text(
        "Makbuz Gönderildi.",
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
