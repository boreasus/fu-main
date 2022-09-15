// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fu_mobile/reporting/searchResults.dart';
import 'package:intl/intl.dart';

import '../utilities/constant.dart';

// ignore: camel_case_types
class transactionReport extends StatefulWidget {
  const transactionReport({Key? key}) : super(key: key);

  @override
  State<transactionReport> createState() => _transactionReportState();
}

// ignore: camel_case_types
class _transactionReportState extends State<transactionReport> {
  TextEditingController dateInputStart = TextEditingController();
  TextEditingController dateInputEnd = TextEditingController();
  late DateTime d1;
  late DateTime d2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 110,
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
        title: Text("İşlem Raporu", style: TextStyle(color: primaryBrand)),
      ),
      body: Container(
        decoration: BoxDecoration(color: bgColor),
        child: Center(
          child: Column(
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24.0, 24, 0, 0),
                    child: const Text(
                      "Lütfen Tarih aralığı seçiniz.",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 22.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: headColor,
                      border: Border.all(color: primaryBrand)),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                    child: TextField(
                      controller: dateInputStart,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.calendar_today,
                          color: primaryBrand,
                        ),
                        hintText: "Başlangıç Tarihi",
                      ),
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
                            d1 = pickedDate;

                            dateInputStart.text = formattedDate;
                          });
                        } else {}
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: headColor,
                      border: Border.all(color: primaryBrand)),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                    child: TextField(
                      controller: dateInputEnd,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.calendar_today,
                          color: primaryBrand,
                        ),
                        hintText: "Bitiş Tarihi",
                      ),
                      readOnly: true,
                      onTap: () async {
                        if (dateInputStart.text.isNotEmpty) {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: d1,
                              lastDate: DateTime(2101));
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            setState(() {
                              d2 = pickedDate;

                              dateInputEnd.text = formattedDate;
                            });
                          }
                        } else {
                          showAlertDialog(context, 2);
                        }
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: SizedBox(
                  width: 360,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (dateInputStart.text == "" ||
                          dateInputEnd.text == "") {
                        showAlertDialog(context, 1);
                      } else if (d1.compareTo(d2) > 0) {
                        showAlertDialog(context, 2);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => searchResults(
                                  startDate: dateInputStart.text,
                                  endDate: dateInputEnd.text),
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: primaryBrand,
                    ),
                    child: Text(
                      "Ara",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Create AlertDialog

showAlertDialog(BuildContext context, situation) {
  // Create button
  Widget okButton = TextButton(
    child: Text(
      "Tamam",
      style: TextStyle(fontSize: 18, color: okColor),
    ),
    onPressed: () {
      Navigator.pop(
        context,
      );
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    content: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: Text(
        situation == 1
            ? "Lütfen iki tarih alanını da doldurun."
            : "Lütfen önce başlangıç tarihini giriniz. ",
        style: TextStyle(fontSize: 15),
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
