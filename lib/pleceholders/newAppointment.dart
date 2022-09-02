// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fu_mobile/services/GetLawyerTransactionsAppointmentBImeiNoService.dart';
import 'package:fu_mobile/services/InsertLawyerAppointmentService.dart';
import 'package:intl/intl.dart';
import '../utilities/constant.dart';
import 'package:fu_mobile/entity/GetLawyerTransactionsAppointmentBImeiNo.dart';

// ignore: camel_case_types
class newAppointment extends StatefulWidget {
  const newAppointment({Key? key}) : super(key: key);
  @override
  State<newAppointment> createState() => _newAppointmentState();
}

// ignore: camel_case_types
class _newAppointmentState extends State<newAppointment> {
  String? selected_appointment = "Randevu Seçin";
  late String fuRefNo;
  String? selected_date = "Tarih Seçin";
  var itemsNoConnection = [
    'Internet bağlantınızı kontrol edin',
  ];
  String? response;

  TextEditingController dateinput = TextEditingController(text: "Tarih Seçin");
  TimeOfDay selectedTime = TimeOfDay.now();
  String? formattedDate;
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
        title: Text("Yeni Randevu Al", style: TextStyle(color: primaryBrand)),
      ),
      body: Container(
        decoration: BoxDecoration(color: bgColor),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                child: FutureBuilder<List<Log>>(
                    future: getLawyerTransactionsAppointmentBImeiNoService(),
                    builder: (context, snapshot) => snapshot.hasData
                        ? ButtonTheme(
                            alignedDropdown: true,
                            child: SizedBox(
                              child: DropdownButton(
                                borderRadius: BorderRadius.zero,
                                underline: SizedBox(),
                                isExpanded: true,
                                elevation: 0,
                                hint: Text(
                                  selected_appointment!,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                itemHeight: null,
                                //value: selected_department,
                                items: snapshot.data!.map((item) {
                                  return DropdownMenuItem(
                                    // ignore: sort_child_properties_last
                                    child: Column(
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            item.New_name,
                                            style: TextStyle(fontSize: 15),
                                          ),
                                        ),
                                      ],
                                    ),
                                    value: item,
                                  );
                                }).toList(),
                                onChanged: (Log? value) {
                                  setState(() {
                                    selected_appointment = value!.New_name;
                                    fuRefNo = value.New_FuReferansNo;
                                    print("$selected_appointment $fuRefNo");
                                  });
                                },
                              ),
                            ),
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
                              selected_appointment = value;
                              print(selected_appointment);
                            },
                          )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 0.0),
              child: Container(
                width: 350,
                height: 1,
                color: Colors.grey,
              ),
            ),
            InkWell(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2024));
                if (pickedDate != null) {
                  setState(() {
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    dateinput.text = formattedDate;
                    print(dateinput.text);
                  });
                } else {}
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.82,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                      child: Text(
                        dateinput.text,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 15,
                      height: 18,
                      child: IconButton(
                        icon: Icon(Icons.keyboard_arrow_right,
                            color: Colors.black),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Container(
                width: 350,
                height: 1,
                color: Colors.grey,
              ),
            ),
            InkWell(
              onTap: () {
                _selectTime(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Text(
                        selectedTime.hour.toInt() < 10
                            ? "0${selectedTime.hour}"
                            : "${selectedTime.hour}",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        ":",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        selectedTime.minute.toInt() < 10
                            ? "0${selectedTime.minute}"
                            : "${selectedTime.minute}",
                        style: TextStyle(fontSize: 15),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 15,
                        height: 18,
                        child: IconButton(
                          icon: Icon(Icons.keyboard_arrow_right,
                              color: Colors.black),
                          onPressed: () {
                            _selectTime(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
              padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
              child: Container(
                width: 600,
                height: 200,
                decoration: BoxDecoration(
                  color: headColor,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(27.0),
                          child: Icon(Icons.list_alt_outlined,
                              color: primaryBrand),
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                selected_appointment ?? "Randevu Yeri",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(27.0, 15, 0.0, 0.0),
                          child: Icon(
                            Icons.date_range,
                            color: primaryBrand,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(27.0, 10, 0.0, 0.0),
                          child: Text(dateinput.text),
                        ),
                      ],
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(27.0, 27, 0.0, 0.0),
                          child: Icon(
                            Icons.alarm,
                            color: primaryBrand,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(27.0, 27, 0.0, 0.0),
                          child: Container(
                            child: Row(children: [
                              Text(
                                selectedTime.hour.toInt() < 10
                                    ? "0${selectedTime.hour}"
                                    : "${selectedTime.hour}",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                ":",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                selectedTime.minute.toInt() < 10
                                    ? "0${selectedTime.minute}"
                                    : "${selectedTime.minute}",
                                style: TextStyle(fontSize: 15),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ],
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
                          onPressed: () async {
                            response == null ? showW8(context) : null;
                            response = await InsertLawyerAppointmentService(
                                fuRefNo,
                                "${selectedTime.hour}:${selectedTime.minute}",
                                dateinput.text.substring(0, 4),
                                dateinput.text.substring(5, 7),
                                dateinput.text.substring(8, 10));
                            response == "OK"
                                ? await showAlertDialogTrue(context, response)
                                : showAlertDialogFalse(context);
                          },
                          child: SizedBox(
                              width: 300,
                              height: 24,
                              child: Text(
                                "Randevuyu Kaydet",
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
    );
  }

  _selectTime(BuildContext context) async {
    TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.input,
      confirmText: "Seç",
      cancelText: "İptal",
      hourLabelText: "Saat",
      minuteLabelText: "Dakika",
      helpText: "Randevu Tarihi Seçiniz",
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? Container(),
        );
      },
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

//Aler dialogs "Randevu alınmıştır"

  showAlertDialogTrue(BuildContext context, String? response) {
    // Create button
    Widget okButton = TextButton(
      child: Text(
        response ?? "",
        style: TextStyle(fontSize: 18, color: okColor),
      ),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: Text(
          "Randevunuz Alınmıştır.",
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

//Aler Dialogs "Randevu alınamadı"
  showAlertDialogFalse(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
      child: Text(
        "Tamam",
        style: TextStyle(fontSize: 18, color: okColor),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: Text(
          "Randevu alınamadı.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14),
        ),
      ),
      actions: [
        Column(
          children: [
            Container(
              width: 250,
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
}

showW8(BuildContext context) {
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    content: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: Wrap(children: [Center(child: CircularProgressIndicator())]),
    ),
    actions: [
      Column(
        children: [
          Container(
            width: 500,
            height: 0.5,
            color: Colors.black26,
          ),
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
