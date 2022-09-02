// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fu_mobile/deals/pendingDeals.dart';
import 'package:fu_mobile/entity/AgreementDeals.dart';
import 'package:fu_mobile/services/agrementDealsService.dart';
import '../utilities/constant.dart';

// ignore: camel_case_types
class agreementsMade extends StatefulWidget {
  const agreementsMade({Key? key}) : super(key: key);

  @override
  State<agreementsMade> createState() => _agreementsMadeState();
}

// ignore: camel_case_types
class _agreementsMadeState extends State<agreementsMade> {
  String? id;
  String? donem;
  String? islem;
  String? brut;
  String? stopaj;
  String? kdv;
  String? netkazanc;
  String? mutabakat;

  @override
  void initState() {
    AgreementDealClient("A8B4084027").then((value) => {
          id = value.id,
          donem = value.donem,
          islem = value.islem,
          brut = value.brut,
          stopaj = value.stopaj,
          kdv = value.kdv,
          netkazanc = value.netkazanc,
          mutabakat = value.mutabakat,
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 50.0, 0.0),
            child: Center(
                child: Text("Yapılacak Mutabakatlarım",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: primaryBrand))),
          ),
        ),
        body: FutureBuilder<Data>(
            future: AgreementDealClient("A8B4084027"),
            builder: (context, snapshot) => snapshot.hasData
                ? Container(
                    color: bgColor,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 25.0, 0, 0),
                      child: Column(
                        children: [
                          Container(
                            width: 500,
                            height: 300,
                            decoration: BoxDecoration(color: headColor),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            30.0, 20.0, 0.0, 0.0),
                                        child: Text(
                                          "Dönem",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            130.0, 20.0, 0.0, 0.0),
                                        child: Text(
                                          snapshot.data!.donem,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: 360,
                                      height: 1,
                                      color: primaryGray,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            30.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          "İşlem Sayısı",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            100.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          snapshot.data!.islem,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: 360,
                                      height: 1,
                                      color: primaryGray,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            30.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          "Brüt Tutar",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            110.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          snapshot.data!.brut,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: 360,
                                      height: 1,
                                      color: primaryGray,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            30.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          "Stopaj",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            140.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          snapshot.data!.stopaj,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: 360,
                                      height: 1,
                                      color: primaryGray,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            30.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          "KDV",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            155.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          snapshot.data!.kdv,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: 360,
                                      height: 1,
                                      color: primaryGray,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            30.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          "Toplam Alacak",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            80.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          snapshot.data!.netkazanc,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Container(
                                      width: 360,
                                      height: 1,
                                      color: primaryGray,
                                    ),
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
                                    width: 290,
                                    height: 52,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: primaryBrand,
                                        ),
                                        onPressed: () {
                                          showAlertDialogTrue(context, "");
                                        },
                                        child: Center(
                                            child: Text(
                                          "Mutabakat Uygunluğu Bildir",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 17),
                                        ))),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
                : Center(child: CircularProgressIndicator())));
  }
}

showAlertDialogTrue(BuildContext context, String text) {
  // Create button
  Widget okButton = TextButton(
    child: Text(
      "Tamam",
      style: TextStyle(fontSize: 18, color: okColor),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => pendingDeals()),
      );
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    content: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: SizedBox(
        width: 300,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: const [
                  Text(
                    "Vergi Dairesi: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Boğaziçi Kurumlar",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: const [
                  Text(
                    "Vergi No:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "43434343434343434344",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Text(
              "Düzenlemiş olduğunuz makbuza ilişkin ödeme aynı ayın 20'siyle başlayan haftasının ilk Cuma günü yapılacaktır.",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
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
