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
  TextEditingController dateinput = TextEditingController();
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
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 24.0, 220.0, 0.0),
                child: Text(
                  "Lütfen Tarih aralığı seçiniz.",
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 22.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: headColor,
                      border: Border.all(color: primaryBrand)),
                  width: 360,
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                    child: TextField(
                      controller: dateinput,
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
                            dateinput.text = formattedDate;
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
                  width: 360,
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                    child: TextField(
                      controller: dateinput,
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
              ),
              Padding(
                padding: EdgeInsets.all(24.0),
                child: SizedBox(
                  width: 360,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => searchResults()),
                      );
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
