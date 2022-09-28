import 'package:flutter/material.dart';
import 'package:fu_mobile/services/Get_ZiyaretList_ByImeiNOService.dart';
import 'package:fu_mobile/visits/resultNotification.dart';
import 'package:fu_mobile/entity/Get_ZiyaretList_ByImeiNO.dart';

import '../utilities/constant.dart';

// ignore: camel_case_types
class visits extends StatefulWidget {
  const visits({Key? key}) : super(key: key);

  @override
  State<visits> createState() => _visitsState();
}

var SelectedCard = 0;

Widget bottomMenu(BuildContext context) => Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.14,
      color: headColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.72,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryBrand,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => resultNotification())));
                  },
                  child: Center(
                      child: Text(
                    "Ziyaret Sonucu Ekle",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 19),
                  ))),
            ),
          ),
        ],
      ),
    );

// ignore: camel_case_types
class _visitsState extends State<visits> {
  FutureBody(BuildContext context, List<Log> data) => Container(
        color: bgColor,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: ((context, index) {
                          return FutureCard(context, data[index].Tanim,
                              data[index].New_Ziyaret_Tarihi, index);
                        }))),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      );

  FutureCard(BuildContext context, name, date, index) => Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: headColor,
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, offset: Offset(0.0, 2.0), blurRadius: 7.0)
            ],
          ),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 13.0, 16.0, 0.0),
                      child: Text(
                        date,
                        style: TextStyle(color: primaryBrand, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 10.0),
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 14, color: primaryGray),
                      ),
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () {},
                        icon: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        resultNotification()));
                          },
                          icon: Icon(Icons.keyboard_arrow_right),
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: bottomMenu(context),
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
            padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
            child: Text("Ziyaretlerim",
                textAlign: TextAlign.center,
                style: TextStyle(color: primaryBrand)),
          ),
        ),
        body: FutureBuilder<List<Log>>(
            future: getZiyaretList('A8B4084027'),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return FutureBody(context, snapshot.data!);
                } else
                  return Container(
                    child: Center(child: Text('Ziyaretiniz bulunmamaktadır.')),
                  );
              } else
                return Center(child: CircularProgressIndicator());
            })));
  }
}

showAlertDialogTrue(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text(
      "Tamam",
      style: TextStyle(fontSize: 18, color: okColor),
    ),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => visits()));
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    content: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: Text(
        "Ziyaret Sonucu Bildirildi.",
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
