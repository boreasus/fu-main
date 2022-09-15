// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fu_mobile/notifications/notificationDetail.dart';
import 'package:fu_mobile/services/updateStatusofPushLogs.dart';
import 'package:icon_decoration/icon_decoration.dart';
import '../utilities/constant.dart';
import 'package:fu_mobile/entity/GetPushLogs_WithImei2.dart';

// ignore: camel_case_types
class informationNoties extends StatefulWidget {
  final List<Log> data;
  final String category;

  const informationNoties(
      {Key? key, required this.data, required this.category})
      : super(key: key);

  @override
  State<informationNoties> createState() => _informationNotiesState();
}

// ignore: camel_case_types
class _informationNotiesState extends State<informationNoties> {
  String goBackValue = "Mesaj_Okundu";
  List<Log> list = [];
  @override
  void initState() {
    for (var i in widget.data) {
      if (i.Category == widget.category) {
        list.add(i);
      }
    }

    super.initState();
  }

  Padding card(
    index,
    id,
    seen,
    date,
    context,
    title,
    text,
  ) =>
      Padding(
        padding: EdgeInsets.fromLTRB(24, 15, 24, 0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: headColor,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 8, 0, 0),
                    child: DecoratedIcon(
                      icon: Icon(Icons.notifications,
                          color: seen == "Mesaj_Okunmadı"
                              ? primaryBrand
                              : headColor),
                      decoration: IconDecoration(
                          border: seen == "Mesaj_Okunmadı"
                              ? IconBorder()
                              : IconBorder(width: 5, color: primaryBrand)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                    child: Text(
                      seen == "Mesaj_Okundu" ? "Okundu" : "Okunmadı",
                      style: TextStyle(
                          color: seen == "Mesaj_Okunmadı"
                              ? primaryBrand
                              : primaryGray,
                          fontSize: 14,
                          fontWeight: seen == "Mesaj_Okunmadı"
                              ? FontWeight.bold
                              : FontWeight.normal),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 14, 0),
                    child: Text(
                      date,
                      style: TextStyle(
                          color: primaryBrand,
                          fontSize: 12,
                          fontFamily: 'Inter'),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        String result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => notificationDetail(
                                      id: id,
                                      date: date,
                                      title: title,
                                      text: text,
                                    )));
                        updateStatue(id, "5");
                        setState(() {
                          // widget.data[index].MessageStatus = "Mesaj_Okundu";
                          list[index].MessageStatus = "Mesaj_Okundu";
                          print(" index budur: $index");
                          list[index].MessageStatus = result;
                          // String? result = await Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => notificationDetail(
                          //               id: id,
                          //               date: date,
                          //               title: title,
                          //               text: text,
                          //             )));
                          // list[index].MessageStatus = result ?? "Mesaj_Okundu";
                          print(index);
                          print("aaa >> ${widget.data[index].MessageStatus}");
                        });
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: bgColor,
                      )),
                ],
              )
            ],
          ),
        ),
      );

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
            Text("${widget.category}", style: TextStyle(color: primaryBrand)),
      ),
      body: Container(
        decoration: BoxDecoration(color: bgColor),
        child: Center(
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: ((context, index) => card(
                index,
                list[index].PushLogId,
                list[index].MessageStatus,
                list[index].SendingDate,
                context,
                list[index].Title,
                widget.data[index].Content)),
          ),
        ),
      ),
    );
  }
}
