// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../utilities/constant.dart';

// ignore: camel_case_types
class processTable extends StatefulWidget {
  const processTable({Key? key}) : super(key: key);

  @override
  State<processTable> createState() => _processTableState();
}

// ignore: camel_case_types
class _processTableState extends State<processTable> {
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
        title:
            Text("2021 İşlem Tablosu", style: TextStyle(color: primaryBrand)),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: bgColor,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 24.0, 260.0, 5.0),
                  child: Text(
                    "Banka Seçiniz",
                    style: TextStyle(color: primaryGray, fontSize: 14),
                  ),
                ),
                Container(
                  width: 350,
                  height: 50,
                  decoration: BoxDecoration(
                    color: headColor,
                    border: Border.all(color: primaryGray),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 300,
                        height: 40,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Akbank A.Ş",
                                hintStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                border: InputBorder.none),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            color: primaryGray,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                  child: SizedBox(
                    width: 340,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(color: primaryBrand),
                      child: Row(
                        children: [
                          Container(
                            width: 170,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: bgColor)),
                            child: Center(
                                child: Text(
                              "Ay",
                              style: TextStyle(color: headColor),
                            )),
                          ),
                          Container(
                            width: 170,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: bgColor)),
                            child: Center(
                                child: Text(
                              "İşlem Sayısı",
                              style: TextStyle(color: headColor),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 340,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(color: headColor),
                    child: Row(
                      children: [
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "İşlem Sayısı",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 340,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(color: headColor),
                    child: Row(
                      children: [
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Ay",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "İşlem Sayısı",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 340,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(color: headColor),
                    child: Row(
                      children: [
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Ay",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "İşlem Sayısı",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 340,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(color: headColor),
                    child: Row(
                      children: [
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Ay",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "İşlem Sayısı",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 340,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(color: headColor),
                    child: Row(
                      children: [
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Ay",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "İşlem Sayısı",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 340,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(color: headColor),
                    child: Row(
                      children: [
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Ay",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "İşlem Sayısı",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 340,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(color: headColor),
                    child: Row(
                      children: [
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Ay",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "İşlem Sayısı",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 340,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(color: headColor),
                    child: Row(
                      children: [
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Ay",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "İşlem Sayısı",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 340,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(color: headColor),
                    child: Row(
                      children: [
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Ay",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "İşlem Sayısı",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 340,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(color: headColor),
                    child: Row(
                      children: [
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Ay",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "İşlem Sayısı",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 340,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(color: headColor),
                    child: Row(
                      children: [
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Ay",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                        Container(
                          width: 170,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "İşlem Sayısı",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  child: SizedBox(
                    width: 340,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(color: headColor),
                      child: Row(
                        children: [
                          Container(
                            width: 170,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: bgColor)),
                            child: Center(
                                child: Text(
                              "Ay",
                              style: TextStyle(color: headColor),
                            )),
                          ),
                          Container(
                            width: 170,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(color: bgColor)),
                            child: Center(
                                child: Text(
                              "İşlem Sayısı",
                              style: TextStyle(color: headColor),
                            )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
