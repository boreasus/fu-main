// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../utilities/constant.dart';
import 'newAppointment.dart';

// ignore: camel_case_types
class myAppointment extends StatefulWidget {
  const myAppointment({Key? key}) : super(key: key);
  @override
  State<myAppointment> createState() => _myAppointmentState();
}

// ignore: camel_case_types
class _myAppointmentState extends State<myAppointment> {
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
        title: Text("Randevularım", style: TextStyle(color: primaryBrand)),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: headColor,
                      border: Border.all(color: primaryBrand)),
                  width: 350,
                  height: 50,
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.fromLTRB(13.0, 15.0, 0.0, 20.0),
                        child: Icon(
                          Icons.search,
                          color: primaryBrand,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 30,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20.0, 13.0, 0.0, 0.0),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Arama"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                child: SizedBox(
                  width: 350,
                  height: 95,
                  child: Container(
                    decoration: BoxDecoration(
                      color: headColor,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(18.0, 10, 0.0, 0.0),
                              child: Text(
                                "Rand. Tarihi:",
                                style:
                                    TextStyle(fontSize: 13, color: primaryGray),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(1.0, 10, 0.0, 0.0),
                              child: Text(
                                "30.05.2022-15.30",
                                style: TextStyle(
                                    color: primaryBrand, fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 10.0, 130.0, 0.0),
                          child: Text(
                            "Akbank A.Ş Sinop müşterisi",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(200.0, 20.0, 15.0, 0.0),
                          child: Text(
                            "22.05.2022-15.33",
                            style: TextStyle(color: primaryGray),
                          ),
                        )
                      ],
                    ),
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
                        width: 300,
                        height: 52,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: primaryBrand,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const newAppointment()),
                              );
                            },
                            child: SizedBox(
                                width: 300,
                                height: 24,
                                child: Text(
                                  "Yeni Randevu Al",
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
