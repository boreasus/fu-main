// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utilities/constant.dart';
import 'package:fu_mobile/entity/Get_OFF_Days_From_SystemUser_With_Imei2.dart';
import 'package:fu_mobile/services/Get_OFF_Days_From_SystemUser_With_Imei2_Service.dart';

String parseString(str) {
  if (str.length == 8) {
    return str;
  } else if (str.length == 9) {
    if (str[1] == "/") {
      String tempMonth = "${str[2]}${str[3]}";
      String tempDay = "${str[0]}";
      String tempYear = "${str[5]}${str[6]}${str[7]}${str[8]}";
      str = "${tempMonth}/${tempDay}/${tempYear}";
      return str;
    } else {
      String tempMonth = "${str[3]}";
      String tempDay = "${str[0]}${str[1]}";
      String tempYear = "${str[5]}${str[6]}${str[7]}${str[8]}";
      str = "${tempMonth}/${tempDay}/${tempYear}";
      return str;
    }
  } else if (str.length == 10) {
    String tempMonth = "${str[3]}${str[4]}";
    String tempDay = "${str[0]}${str[1]}";
    String tempYear = "${str[6]}${str[7]}${str[8]}${str[9]}";
    str = "${tempMonth}/${tempDay}/${tempYear}";
    return str;
  }

  return str;
}

// ignore: camel_case_types
class myPermissions extends StatefulWidget {
  const myPermissions({Key? key}) : super(key: key);
  @override
  State<myPermissions> createState() => _myPermissionsState();
}

// ignore: camel_case_types
class _myPermissionsState extends State<myPermissions> {
  showAlertDialogTrue(BuildContext context, startDate, endDate) {
    // Create button
    Widget okButton = TextButton(
      child: Text(
        "Tamam",
        style: TextStyle(fontSize: 18, color: okColor),
      ),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pop(context);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => myPermissions()));
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

    AlertDialog alertFail = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: Text(
          "İzin girişiniz gerçekleştirilemedi.",
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
            children: [CircularProgressIndicator()],
          )),
    );

//getOffDaysFromUser("A8B4084027", "true", startDate.text, endDate.text);
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder<Log>(
            future:
                getOffDaysFromUser("A8B4084027", "true", startDate, endDate),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return alert;
                } else
                  return alertFail;
              } else {
                return alertLoading;
              }
            }));
      },
    );
  }

  showAlertDialogMiss(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
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
          "Lütfen tarih alanlarını eksiksiz doldurun.",
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

//getOffDaysFromUser("A8B4084027", "true", startDate.text, endDate.text);
    // show the dialog
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  late Future<Log> future;
  @override
  void initState() {
    future =
        getOffDaysFromUser("A8B4084027", "false", "01.01.1990", "01.01.2030");
    super.initState();
  }

  Widget futureBody(Log data) {
    String startDateParsed = parseString(data.BaslangicTarihi);
    String endDateParsed = parseString(data.BitisTarihi);
    return Container(
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
                width: MediaQuery.of(context).size.width - 40,
                height: 100,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 12.0, 24.0, 12.0),
                  child: Center(
                    child: Text.rich(TextSpan(
                        text: 'En son ',
                        style: TextStyle(fontSize: 16),
                        children: <InlineSpan>[
                          TextSpan(
                            text: data.BaslangicTarihi == "-"
                                ? ""
                                : "${startDateParsed} - ${endDateParsed}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: data.BaslangicTarihi == "-"
                                ? "İzin kaydınız bulunmamaktadır."
                                : ' Tarihleri arasında izin kaydınız alınmıştır.',
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
                width: MediaQuery.of(context).size.width - 100,
                height: 50,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                  child: TextField(
                    controller: startDate,
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
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);

                        setState(() {
                          startDate.text = formattedDate;
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
                width: MediaQuery.of(context).size.width - 100,
                height: 50,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                  child: TextField(
                    controller: endDate,
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
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101));
                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);

                        setState(() {
                          endDate.text = formattedDate;
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
                width: MediaQuery.of(context).size.width - 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: primaryBrand),
                    onPressed: () async {
                      if (startDate.text.isEmpty || endDate.text.isEmpty) {
                        showAlertDialogMiss(context);
                      } else {
                        await showAlertDialogTrue(
                            context, startDate.text, endDate.text);
                      }
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
    );
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
          title: Text("İzinlerim", style: TextStyle(color: primaryBrand)),
        ),
        body: FutureBuilder<Log>(
          future: future,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return futureBody(snapshot.data!);
              } else {
                return futureBody(Log(BaslangicTarihi: "-", BitisTarihi: "-"));
              }
            } else {
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
            }
          }),
        ));
  }
}

//izin girişi True