// ignore_for_file: file_names, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:fu_mobile/services/getWorkFollowByImeiNoService.dart';
import 'package:fu_mobile/visits/resultNotification.dart';
//import 'package:fu_mobile/visits/visits.dart';
import 'package:fu_mobile/entity/getWorkFollowByImeiNo.dart';
import 'package:image_cropper/image_cropper.dart';
import '../utilities/constant.dart';
import 'package:fu_mobile/services/sendLawyerEmailMobileReportService.dart';

// ignore: camel_case_types
class searchResults extends StatefulWidget {
  final String startDate;
  final String endDate;
  const searchResults(
      {Key? key, required this.startDate, required this.endDate})
      : super(key: key);

  @override
  State<searchResults> createState() => _searchResultsState();
}

// ignore: camel_case_types
class _searchResultsState extends State<searchResults> {
  FutureBody(BuildContext context, List<Log> data) => Container(
        color: bgColor,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 47,
                color: primaryBrand,
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 29.0),
                      child: Text(
                        '${widget.startDate} - ${widget.endDate}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 29.0),
                      child: Text(
                        'İşlem Adedi: ${data.length}',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 0.0),
                child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 1,
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: ((context, index) {
                          return FutureCard(context, data[index].IslemAdi,
                              data[index].IslemTarih, index);
                        }))),
              ),
            ],
          ),
        ),
      );

  var SelectedCard = 0;

  FutureCard(BuildContext context, name, date, index) => Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.12,
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
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 14, color: primaryGray),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget bottomMenu(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        color: headColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.72,
                height: 52,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryBrand,
                    ),
                    onPressed: () async {
                      showAlertDialogTrue(
                          context, widget.startDate, widget.endDate);
                    },
                    child: Center(
                        child: Text(
                      "Gönder",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17),
                    ))),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    print(">>>>>>>>>>>>> ${widget.startDate}, ${widget.endDate}");
    return Scaffold(
        bottomSheet: bottomMenu(context),
        appBar: AppBar(
          toolbarHeight: 80,
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
          title: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: Text("Raporlama Arama Sonuçları",
                textAlign: TextAlign.center,
                style: TextStyle(color: primaryBrand)),
          ),
        ),
        body: FutureBuilder<List<Log>>(
          future: GetWorkFollowByImeiNoService(
              'A8B4084027', widget.startDate, widget.endDate),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return FutureBody(context, snapshot.data!);
              } else
                return Container(
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.startDate} - ${widget.endDate}',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100.0),
                        child:
                            Text('\ntarihleri arasında rapor bulunmamaktadır.'),
                      ),
                    ],
                  )),
                );
            } else
              return Center(child: CircularProgressIndicator());
          }),
        ));
  }
}

showAlertDialogTrue(BuildContext context, s, e) {
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
      child: FutureBuilder<String>(
        future: sendLawyerEmailMobileReportService('A8B4084027', s, e),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Text(
              "${snapshot.data == 'true' ? "Adresinize e-posta gönderilmiştir." : "E-mail gönderilemedi."}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            );
          } else
            return SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                child: Center(child: CircularProgressIndicator()));
        }),
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
