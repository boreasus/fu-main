import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fu_mobile/services/loginByImeiNewService.dart';
import 'package:fu_mobile/entity/LoginByImeiNew.dart';
import 'package:fu_mobile/transactions/transactionDetail.dart';
import '../utilities/constant.dart';

class ViewTransactions extends StatefulWidget {
  const ViewTransactions({Key? key}) : super(key: key);

  @override
  State<ViewTransactions> createState() => _ViewTransactionsState();
}

class _ViewTransactionsState extends State<ViewTransactions> {
  String? cntr = "";
  String dropdownvalue = 'Item 1';
  List list = [];
  List counter = [];
  String categories = "Tümü";
  TextEditingController searchController = TextEditingController();
  String searchValue = "";

  Map<String, Color> colors = {
    '1': Color.fromARGB(255, 149, 149, 149),
    '2': Color.fromARGB(255, 75, 82, 207),
    '41': Color.fromARGB(255, 52, 180, 65),
    '24': Color.fromARGB(255, 207, 130, 75),
    '3': Color.fromARGB(255, 208, 52, 52),
  };
  List<Log> logList = [];

  String filter = "99";
  var filt = 0;
  Color clrCircle = primaryBrand;

  SizedBox futureSizedBox(context, snapshot, colors, filter) {
    List<Log> logList = [];
    if (filter == "99") {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.65,
        child: ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: ((context, index) => snapshot.data![index].Ad
                  .toString()
                  .toLowerCase()
                  .contains(searchValue)
              ? card(
                  snapshot.data![index].Ad,
                  snapshot.data![index].New_TapuRandevuTarihi,
                  context,
                  colors[snapshot.data![index].New_IsinTipi],
                  snapshot.data![index].New_IsinTipi,
                  snapshot.data![index].New_FuReferansNo,
                )
              : Container()),
        ),
      );
    } else {
      logList = snapshot.data!
          .where((element) => element.New_IsinTipi == filter)
          .toList();
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.65,
        child: ListView.builder(
          itemCount: logList.length,
          itemBuilder: ((context, index) =>
              logList[index].Ad.toString().toLowerCase().contains(searchValue)
                  ? card(
                      logList[index].Ad,
                      logList[index].New_TapuRandevuTarihi,
                      context,
                      colors[logList[index].New_IsinTipi],
                      logList[index].New_IsinTipi,
                      snapshot.data![index].New_FuReferansNo,
                    )
                  : Container()),
        ),
      );
    }
  }

  FutureBuilder<List<Log>> futureBody(context, colors) => FutureBuilder(
      future: LoginByImeiNew("A8B4084027"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          filt = int.parse(filter);

          if (filt != 1) {
            for (var i = 0; i < snapshot.data!.length; i++) {
              list.add(snapshot.data![i].New_IsinTipi);
            }
            list = list.toSet().toList();
            for (var i = 0; i < list.length; i++) {
              counter.add(0);
            }
            for (var i in snapshot.data!) {
              for (var j = 0; j < list.length; j++) {
                if (i.New_IsinTipi == list[j]) {
                  counter[j] += 1;
                }
              }
            }
          }

          // print(counter);
          // print(list);

          return Container(
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
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: 40,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(13.0, 8.0, 0.0, 20.0),
                            child: Icon(
                              Icons.search,
                              color: primaryBrand,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 30,
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 13.0, 0.0, 0.0),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    searchValue = value.toLowerCase();
                                  });
                                },
                                controller: searchController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Arama"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showDialog(context);
                      print(filter);
                    },
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 25.0, 0.0, 0.0),
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: clrCircle,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          10.0, 27, 0.0, 0.0),
                                      child: TextButton(
                                          onPressed: () {
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                            Future.delayed(
                                                Duration(milliseconds: 500),
                                                () async {
                                              _showDialog(context);
                                            });
                                          },
                                          child: Text(categories,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black)))),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 27, 0, 0),
                                    child: Text(
                                      snapshot.data!.length.toString(), //burası
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                              child: IconButton(
                                  onPressed: () {
                                    _showDialog(context);
                                  },
                                  icon: Icon(Icons.arrow_drop_down)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 327,
                    height: 1,
                    color: primaryGray,
                  ),
                  futureSizedBox(context, snapshot, colors, filter)
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });

  Future<void> _showDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                      onTap: (() {
                        Navigator.pop(context, "99");
                        setState(() {
                          filter = "99";
                          categories = "Tümü";
                          clrCircle = primaryBrand;
                        });
                      }),
                      child: AlertData("Tümü", "6", primaryBrand, 180)),
                  InkWell(child: ContainerLine()),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context, "3");
                        setState(() {
                          filter = "2";
                          categories = "Tapu Randevusu alınmış";
                          clrCircle = blueColor;
                        });
                      },
                      child: AlertData(
                          "Tapu Randevusu alınmış", "6", blueColor, 65)),
                  ContainerLine(),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context, "4");
                        setState(() {
                          filter = "1";
                          categories = "İpotek Evrağı gönderilmiş";
                          clrCircle = greenColor;
                        });
                      },
                      child: AlertData(
                          "İpotek Evrağı gönderilmiş", "6", greenColor, 60)),
                  ContainerLine(),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context, "24");
                        setState(() {
                          filter = "24";
                          categories = "Evrağı Gönderilmiş-Diğer";
                          clrCircle = orngColor;
                        });
                      },
                      child: AlertData(
                          "Evrağı Gönderilmiş-Diğer", "6", orngColor, 63)),
                  ContainerLine(),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context, "6");
                        setState(() {
                          filter = "3";
                          categories = "Gönderilmeyen";
                          clrCircle = redColor;
                        });
                      },
                      child: AlertData("Gönderilmeyen", "6", redColor, 122)),
                  ContainerLine(),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context, "7");
                        setState(() {
                          filter = "1";
                          categories = "Diğer";
                          clrCircle = gryColor;
                        });
                      },
                      child: AlertData("Diğer", "6", gryColor, 183)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomSheet: Container(height: 1),
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: 110,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: primaryGray,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: headColor,
          title: Text("İşlemleri görüntüle",
              style: TextStyle(color: primaryBrand)),
        ),
        body: futureBody(context, colors));
  }
}

class AlertData extends StatelessWidget {
  late String text;
  late String number;
  late Color getColor;
  late double paddingLeft;

  AlertData(this.text, this.number, this.getColor, this.paddingLeft);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 20.0, 0.0, 0.0),
          child: Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: getColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10.0, 20, 0, 0),
          child: Text(text),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(paddingLeft, 24, 0, 0),
          child: Text(number),
        ),
      ],
    );
  }
}

class ContainerLine extends StatelessWidget {
  const ContainerLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 16, 0, 0),
      child: Container(
        color: primaryGray,
        height: 1,
      ),
    );
  }
}

Padding card(name, date, context, clr, num, furefno) {
  name = name as String;
  name = name.substring(12);
  print("${clr} = clr    $num = num");
  print("$furefno");
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Container(
      color: clr,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: InkWell(
          onTap: () {
            print("bu numdur $num");
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TransactionDetail(
                        furefno: furefno,
                        num: num,
                      )),
            );
          },
          child: Column(
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 15, fontFamily: 'Inter', color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Spacer(),
                  Text(
                    date,
                    style: TextStyle(
                        fontSize: 15, fontFamily: 'Inter', color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
