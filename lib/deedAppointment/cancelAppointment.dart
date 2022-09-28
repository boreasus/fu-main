// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fu_mobile/services/Get_Randevu_Iptal_Nedenleri_List_Service.dart';
import 'package:fu_mobile/services/deleteAppointmentService.dart';
import '../entity/Get_Randevu_Iptal_Nedenleri_List.dart';
import '../utilities/constant.dart';

// ignore: camel_case_types
class cancelAppointment extends StatefulWidget {
  final String fuRefNo;
  final String date;
  const cancelAppointment({Key? key, required this.fuRefNo, required this.date})
      : super(key: key);

  @override
  State<cancelAppointment> createState() => _cancelAppointmentState();
}

// ignore: camel_case_types
class _cancelAppointmentState extends State<cancelAppointment> {
  showAlertDialogTrue(BuildContext context, unic, reason) {
    // Create button
    Widget okButton = TextButton(
        child: Text(
          "Tamam",
          style: TextStyle(fontSize: 18, color: okColor),
        ),
        onPressed: () {
          Navigator.pop(context);
        });

    Widget okButtonWithBackPress() => TextButton(
        child: Text(
          "Tamam",
          style: TextStyle(fontSize: 18, color: okColor),
        ),
        onPressed: () {
          Navigator.pop(context);
        });
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: Text(
          "Randevunuz iptal edildi.",
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
            okButtonWithBackPress(),
          ],
        )
      ],
    );

    AlertDialog alertFail = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: Text(
          "Randevunuz iptal edilemedi.",
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

    AlertDialog alertLoading = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  const Text('Randevunuz iptal ediliyor.')
                ],
              )
            ],
          )),
    );

//getOffDaysFromUser("A8B4084027", "true", startDate.text, endDate.text);
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder<String>(
            future: deleteAppointment(widget.fuRefNo, unic, reason),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  if (snapshot.data == "OK")
                    return alert;
                  else
                    return alertFail;
                } else
                  return alertFail;
              } else {
                return alertLoading;
              }
            }));
      },
    );
  }

  List<Log> items = [];
  Log? dropdownvalue;

  late Future<List<Log>> _future;
  @override
  void initState() {
    _future =
        getRandevuIptalNedenleri(widget.fuRefNo, widget.date).then((value) {
      for (var element in value) {
        items.add(element);
      }
      dropdownvalue = value[0];
      return value;
    });
    super.initState();
  }

  TextEditingController aciklama = TextEditingController();
  Widget widgetBody(List<Log> data) {
    return Container(
      color: bgColor,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(24.0, 25.0, 24.0, 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: primaryGray),
                    color: headColor),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<Log>(
                      alignment: Alignment.bottomCenter,
                      isExpanded: true,
                      // Initial Value
                      value: dropdownvalue,
                      // Down Arrow Icon
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: primaryBrand,
                        ),
                      ),

                      // Array list of items
                      items: items.map((Log itemm) {
                        return DropdownMenuItem(
                          value: itemm,
                          child: Text(itemm.Name),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (Log? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.0, 25.0, 24.0, 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: headColor,
                    border: Border.all(color: primaryGray)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                  child: TextField(
                    controller: aciklama,
                    decoration: InputDecoration(
                        hintText: "Açıklama Giriniz",
                        hintStyle: TextStyle(fontSize: 16),
                        border: InputBorder.none),
                    maxLines: 10,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () {
                      var aciklamaUri = Uri.encodeComponent(aciklama.text);
                      var unic = Uri.encodeComponent(dropdownvalue!.ID);
                      showAlertDialogTrue(context, unic, aciklamaUri);
                    },
                    child: Text(
                      "İptal Et",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

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
              Navigator.pop(context);
            },
          ),
          backgroundColor: headColor,
          title: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text("Randevu İptal", style: TextStyle(color: primaryBrand)),
          ),
        ),
        body: FutureBuilder<List<Log>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return widgetBody(snapshot.data!);
              } else {
                return SafeArea(
                    child: Container(
                  child: Center(
                      child: Text('Randevu iptal nedenleri yüklenemiyor.')),
                ));
              }
            } else
              // ignore: curly_braces_in_flow_control_structures
              return SafeArea(
                  child: Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ));
          },
        ));
  }
}
