// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fu_mobile/services/getPerformansTableService.dart';
import '../utilities/constant.dart';

// ignore: camel_case_types
class performanceTable extends StatefulWidget {
  const performanceTable({Key? key}) : super(key: key);

  @override
  State<performanceTable> createState() => _performanceTableState();
}

// Future get() async {
//   return await GetPerformanceTableClient("A8B4084027", 0);
// }

// ignore: camel_case_types
class _performanceTableState extends State<performanceTable> {
  @override
  void initState() {
    super.initState();
  }

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
            Text("Performans Tablosu", style: TextStyle(color: primaryBrand)),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
            child: Column(
              children: [
                SizedBox(
                  width: 340,
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(color: primaryBrand),
                    child: Row(
                      children: [
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Yıl",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "2020",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "2021",
                            style: TextStyle(color: headColor),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "2022",
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
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Ocak",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            " ",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(0, 'o')),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(1, 'o')),
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
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Şubat",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                            child: Text(""),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(0, 'ş')),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(1, 'ş')),
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
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Mart",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            " ",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(0, 'mt')),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(1, 'mt')),
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
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Nisan",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            " ",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(0, 'n')),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(1, 'n')),
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
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Mayıs",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            " ",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(0, 'ms')),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(1, 'ms')),
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
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Haziran",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            " ",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(0, 'h')),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(1, 'h')),
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
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Temmuz",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            " ",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(0, 't')),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(1, 't')),
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
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Ağustos",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            " ",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(0, 'as')),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(1, 'as')),
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
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Eylül",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            " ",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(0, 'el')),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(1, 'el')),
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
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Ekim",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            " ",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(0, 'em')),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(1, 'em')),
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
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Kasım",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            " ",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(0, 'k')),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(1, 'k')),
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
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            "Aralık",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(
                              child: Text(
                            " ",
                            style: TextStyle(color: Colors.black),
                          )),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(0, 'ak')),
                        ),
                        Container(
                          width: 85,
                          height: 40,
                          decoration:
                              BoxDecoration(border: Border.all(color: bgColor)),
                          child: Center(child: TextBuilder(1, 'ak')),
                        ),
                      ],
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

Widget TextBuilder(int i, String c) {
  return FutureBuilder(
      future: GetPerformanceTableClient("A8B4084027", i, c),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 5, 5),
                    child: Center(
                      child: Text(
                        snapshot.data.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                })
            : Center(
                child: Text(''),
              );
      });
}
