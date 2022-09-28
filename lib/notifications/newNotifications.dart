// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../utilities/constant.dart';
import 'package:fu_mobile/entity/Get_Notification_Departments.dart';
import 'package:fu_mobile/services/get_Notification_DepartmentsService.dart';
import 'package:fu_mobile/entity/GetNotificationStandartText.dart';
import 'package:fu_mobile/services/getNotificationStandartText.dart';

// ignore: camel_case_types
class newNotifications extends StatefulWidget {
  const newNotifications({Key? key}) : super(key: key);

  @override
  State<newNotifications> createState() => _newNotificationsState();
}

// ignore: camel_case_types

class _newNotificationsState extends State<newNotifications> {
  String? selected_department = "Departman Seçin";
  String? selected_text = "Mesaj seçin";
  var itemsNoConnection = [
    'Internet bağlantınızı kontrol edin',
  ];

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
            Text("Yeni Bildirim Gönder", style: TextStyle(color: primaryBrand)),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(color: bgColor),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 40.0, 0.0, 0.0),
                    child: SizedBox(
                      // // width: MediaQuery.of(context).size.width,
                      child: FutureBuilder<List<Log>>(
                          future: Get_Notification_Departments(),
                          builder: (context, snapshot) => snapshot.hasData
                              ? DropdownButton(
                                  elevation: 0,
                                  hint: Text(
                                    selected_department!,
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  //value: selected_department,
                                  items: snapshot.data!.map((item) {
                                    return DropdownMenuItem(
                                      child: Text(item.Name),
                                      value: item.Name,
                                    );
                                  }).toList(),
                                  onChanged: (String? valueS) {
                                    setState(() {
                                      selected_department = valueS;
                                    });
                                  },
                                )
                              : DropdownButton(
                                  hint: Text("Seçilen departman Adı"),
                                  items: itemsNoConnection.map((String items) {
                                    return DropdownMenuItem(
                                      child: Text(items),
                                      value: "Seçilen Departman Adı",
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    selected_department = value;
                                    print(selected_department);
                                  },
                                )),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Container(
                  width: 350,
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 20.0, 0.0, 0.0),
                    child: FutureBuilder<List<LogText>>(
                        future: Get_Notification_Text(),
                        builder: (context, snapshot) => snapshot.hasData
                            ? DropdownButton(
                                elevation: 0,
                                hint: Text(
                                  selected_text!,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                //value: selected_department,
                                items: snapshot.data!.map((item) {
                                  return DropdownMenuItem(
                                    child: Text(item.Name),
                                    value: item.Name,
                                  );
                                }).toList(),
                                onChanged: (String? valueS) {
                                  setState(() {
                                    selected_text = valueS;
                                  });
                                },
                              )
                            : DropdownButton(
                                hint: Text("Seçilen Mesaj Adı"),
                                items: itemsNoConnection.map((String items) {
                                  return DropdownMenuItem(
                                    child: Text(items),
                                    value: "Seçilen Mesaj Adı",
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  selected_department = value;
                                  print(selected_department);
                                },
                              )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: Container(
                  width: 350,
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryGray, width: 1),
                  ),
                  margin: EdgeInsets.all(12),
                  height: 180,
                  width: 350,
                  child: TextFormField(
                    controller: TextEditingController(text: selected_text),
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Mesajınız",
                      fillColor: headColor,
                      filled: true,
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ),
              SizedBox(
                height: 52,
                width: 345,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: primaryBrand),
                    onPressed: () {
                      if (selected_text == "Mesaj seçin" ||
                          selected_department == "Departman Seçin") {
                        _showMyDialog(context);
                      }
                    },
                    child: Text(
                      "Gönder",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    )),
              ),
              Container(
                width: 400,
                height: 300,
                color: bgColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Uyarı'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Lütfen bir departman ve bir mesaj seçin'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Tamam'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
