// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fu_mobile/services/updateStatusofPushLogs.dart';
import '../utilities/constant.dart';

// ignore: camel_case_types
class notificationDetail extends StatefulWidget {
  final String date;
  final String title;
  final String text;
  final String id;
  const notificationDetail(
      {Key? key,
      required this.date,
      required this.title,
      required this.text,
      required this.id})
      : super(key: key);

  @override
  State<notificationDetail> createState() => _notificationDetailState();
}

// ignore: camel_case_types
class _notificationDetailState extends State<notificationDetail> {
  String readed = "Okunmadı olarak işaretle";
  String backPressedDate = "Mesaj_Okundu";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.pop(context, backPressedDate);
          },
        ),
        backgroundColor: headColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text("Bildirim Detayı", style: TextStyle(color: primaryBrand)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: bgColor,
        ),
        child: Column(
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: primaryBrand,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(28, 15.0, 0.0, 15.0),
                    child: Text(
                      widget.date,
                      style: TextStyle(color: headColor, fontSize: 12),
                    ),
                  ),
                  TextButton(
                      onPressed: () async {
                        print(widget.id);
                        var result = await updateStatue(widget.id, "4");
                        print(">>>> $result");
                        setState(() {
                          readed = "Okunmadı olarak işaretlendi";
                          backPressedDate = "Mesaj_Okunmadı";
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(28, 0.0, 0.0, 0.0),
                        child: Text(
                          readed,
                          style: TextStyle(
                              fontSize: 12,
                              color: headColor,
                              decoration: TextDecoration.underline),
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 28.0, 30, 0.0),
              child: Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 1,
                color: primaryGray,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(28.0, 20.0, 28.0, 0.0),
              child: Text(
                widget.text,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
