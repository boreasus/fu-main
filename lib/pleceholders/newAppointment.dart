// ignore_for_file: file_names

import 'dart:ffi';

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
  bool menuOnOff = false;
  String? response;
  Future<List<Log>>? future;
  @override
  void initState() {
    future = getLawyerTransactionsAppointmentBImeiNoService();
    // TODO: implement initState
    super.initState();
  }

  Widget bottomMenu() => Container(
        width: menuOnOff == true ? MediaQuery.of(context).size.width : 0,
        height: menuOnOff == true ? 100 : 0,
        color: headColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                width: menuOnOff == true
                    ? MediaQuery.of(context).size.width - 48
                    : 0,
                height: menuOnOff == true ? 52 : 0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryBrand,
                    ),
                    onPressed: () async {
                      if (selected_appointment == "Randevu Seçin" ||
                          selected_date == "") {
                        return showAlertDialogMiss(context);
                      } else
                        response == null ? showW8(context) : null;
                      response = await InsertLawyerAppointmentService(
                          fuRefNo,
                          "${selectedTime.hour}:${selectedTime.minute}",
                          dateinput.text.substring(0, 4),
                          dateinput.text.substring(5, 7),
                          dateinput.text.substring(8, 10),
                          "99");
                      response == "OK"
                          ? await showAlertDialogTrue(context, response)
                          : showAlertDialogFalse(context);
                    },
                    child: SizedBox(
                        width: 400,
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
      );

  // List<Log> deneme = [Log(New_FuReferansNo: "2", New_name: "Deneme")];

  TextEditingController dateinput = TextEditingController(text: "Tarih Seçin");
  TimeOfDay selectedTime = TimeOfDay.now();
  String? formattedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: menuOnOff == true
          ? bottomMenu()
          : Container(
              height: 1,
            ),
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
          child: Text("Yeni Randevu Al", style: TextStyle(color: primaryBrand)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: bgColor),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<List<Log>>(
                future: future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      // setState(() {
                      //   menuOnOff = true;
                      // });
                      Future.delayed(Duration.zero, () async {
                        setState(() {
                          menuOnOff = true;
                        });
                      });
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: ButtonTheme(
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
                                            alignment: Alignment.bottomLeft,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
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
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0, 0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  locale: const Locale("tr", "TR"),
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime(2024),
                                  builder: (context, child) {
                                    return Theme(
                                        child: child!,
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary:
                                                primaryBrand, // <-- SEE HERE
                                            onPrimary:
                                                Colors.white, // <-- SEE HERE
                                            onSurface:
                                                Colors.black, // <-- SEE HERE
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              primary:
                                                  primaryBrand, // button text color
                                            ),
                                          ),
                                        ));
                                  });
                              if (pickedDate != null) {
                                setState(() {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  dateinput.text = formattedDate;
                                  print(dateinput.text);
                                });
                              } else {}
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        35.0, 20.0, 0.0, 0.0),
                                    child: Text(
                                      dateinput.text,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 40.0),
                                    child: SizedBox(
                                      width: 15,
                                      height: 18,
                                      child: IconButton(
                                        icon: Icon(Icons.keyboard_arrow_right,
                                            color: Colors.black),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
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
                            padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 3.5,
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
                                      Text(
                                        selected_appointment ?? "Randevu Yeri",
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            27.0, 0, 0.0, 0.0),
                                        child: Icon(
                                          Icons.date_range,
                                          color: primaryBrand,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            27.0, 0, 0.0, 0.0),
                                        child: Text(dateinput.text),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            27.0, 27, 0.0, 0.0),
                                        child: Icon(
                                          Icons.alarm,
                                          color: primaryBrand,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            27.0, 27, 0.0, 0.0),
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
                        ],
                      );
                    } else {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                          child: Center(
                            child: Text(
                                'Oluşturabileceğiniz bir randevu bulunmamaktadır.'),
                          ),
                        ),
                      );
                    }
                  } else {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    );
                  }
                }
                // : DropdownButton(
                //     hint: Text("Seçilen departman Adı"),
                //     items: itemsNoConnection.map((String items) {
                //       return DropdownMenuItem(
                //         child: Text(items),
                //         value: "Seçilen Departman Adı",
                //       );
                //     }).toList(),
                //     onChanged: (String? value) {
                //       selected_appointment = value;
                //       print(selected_appointment);
                //     },
                //   )),
                ),
          ),
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

//Aler Dialogs "Randevu alınamadı"
showAlertDialogMiss(BuildContext context) {
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
        "Lütfen randevu ve tarih alanlarını boş bırakmayın.",
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
