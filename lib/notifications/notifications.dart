import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fu_mobile/notifications/informationNotices.dart';
import 'package:fu_mobile/services/getPushLogByIme2Service.dart';
import 'package:fu_mobile/entity/GetPushLogs_WithImei2.dart';
import 'package:fu_mobile/services/updateStatusofPushLogs.dart';
import '../utilities/constant.dart';
import 'package:fu_mobile/notifications/newNotifications.dart';

// ignore: camel_case_types
class notifications extends StatefulWidget {
  const notifications({Key? key}) : super(key: key);
  @override
  State<notifications> createState() => _notificationsState();
}

Container bottomMenu(BuildContext context) => Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width,
      color: headColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 52,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryBrand,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => newNotifications()));
                  },
                  child: SizedBox(
                      child: Text(
                    "Yeni Bildirim Gönder",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ))),
            ),
          ),
        ],
      ),
    );

// ignore: camel_case_types
class _notificationsState extends State<notifications> {
  List list = [];
  List counter = [];
  double opacityVal = 0.0;
  var deneme = <Log>[];
  late var count;
  late Map<String, int> controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: bottomMenu(context),
        appBar: AppBar(
          toolbarHeight: 80,
          leading: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: headColor,
          title: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text("Bildirim Kategorileri",
                style: TextStyle(color: primaryBrand)),
          ),
        ),
        body: Column(children: [
          FutureBuilder<List<Log>>(
            future: getPushLogByImei2("A8B4084027"),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                for (var i = 0; i < snapshot.data!.length; i++) {
                  list.add(snapshot.data![i].Category);
                }
                list = list.toSet().toList();
                for (var i = 0; i < list.length; i++) {
                  counter.add(0);
                }
                for (var i in snapshot.data!) {
                  for (var j = 0; j < list.length; j++) {
                    if (i.Category == list[j]) {
                      counter[j] += 1;
                    }
                  }
                }
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.70,
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: ((context, index) => menus(
                          context,
                          list[index],
                          counter[index],
                          snapshot.data,
                        )),
                  ),
                );
              } else {
                return Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(child: CircularProgressIndicator()));
              }
            }

                /*ListView.builder(itemBuilder: snapshot.data.toSet().toList()) : 
                    CircularProgressIndicator()
                    */
                ),
          ),
        ]));
  }
}

Widget menus(context, category, counter, data) => Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            category,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: primaryBrand),
          width: 24,
          height: 24,
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(
              counter.toString(),
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: IconButton(
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => informationNoties(
                              data: data,
                              category: category,
                              comingFromIslemler: 0,
                            )));
              }),
              icon: Icon(Icons.keyboard_arrow_right)),
        ),
      ],
    );
