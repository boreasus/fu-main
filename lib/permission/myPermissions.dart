// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utilities/constant.dart';

// ignore: camel_case_types
class myPermissions extends StatefulWidget {
  const myPermissions({Key? key}) : super(key: key);
  @override
  State<myPermissions> createState() => _myPermissionsState();
}

// ignore: camel_case_types
class _myPermissionsState extends State<myPermissions> {
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
        title: Text("İzinlerim", style: TextStyle(color: primaryBrand)),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: headColor,
                  ),
                  width: 360,
                  height: 100,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 12.0, 24.0, 12.0),
                    child: Center(
                      child: Text.rich(TextSpan(
                          text: 'En son ',
                          style: TextStyle(fontSize: 16),
                          children: const <InlineSpan>[
                            TextSpan(
                              text: '05.05.2022-13.05.2022',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  ' Tarihleri arasında izin kaydınız alınmıştır.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ])),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 22.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: headColor,
                      border: Border.all(color: primaryBrand)),
                  width: 310,
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
                padding: EdgeInsets.fromLTRB(0.0, 22.0, 0.0, 0.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: headColor,
                      border: Border.all(color: primaryBrand)),
                  width: 310,
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
                padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                child: SizedBox(
                  height: 52,
                  width: 310,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: primaryBrand),
                      onPressed: () {
                        showAlertDialogTrue(context);
                      },
                      child: Text(
                        "Tamam",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//izin girişi True

showAlertDialogTrue(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text(
      "Tamam",
      style: TextStyle(fontSize: 18, color: okColor),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    content: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: Text(
        "İzin girişiniz gerçekleştirilmiştir.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14),
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

//izin girişi false
showAlertDialogFalse(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text(
      "Tamam",
      style: TextStyle(fontSize: 18, color: okColor),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    content: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: Text(
        "Aynı Tarihlerde izin girişiniz bulunmaktadır.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14),
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
