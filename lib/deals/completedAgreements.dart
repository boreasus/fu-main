// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../utilities/constant.dart';
import 'package:fu_mobile/entity/AgreementDeals.dart';
import 'package:fu_mobile/services/agrementDealsService.dart';

// ignore: camel_case_types
class completedAgreements extends StatefulWidget {
  const completedAgreements({Key? key}) : super(key: key);

  @override
  State<completedAgreements> createState() => _completedAgreementsState();
}

// ignore: camel_case_types
class _completedAgreementsState extends State<completedAgreements> {
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
            padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
            child: Text("Tamamlanan Mutabakatlarım",
                textAlign: TextAlign.center,
                style: TextStyle(color: primaryBrand)),
          ),
        ),
        body: FutureBuilder<Data>(
            future: AgreementDealClient("A8B4084027"),
            builder: (context, snapshot) => snapshot.hasData
                ? Container(
                    color: bgColor,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0, 0),
                        child: Column(children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.43,
                              decoration: BoxDecoration(color: headColor),
                              child: Center(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.41,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      27.0, 16, 0, 0),
                                              child: Text(
                                                "Dönem",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            SizedBox(
                                              // ignore: sort_child_properties_last
                                              child: Container(
                                                  color: Colors.grey[300]),
                                              height: 1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 27.0),
                                              child: Text(
                                                "İşlem Sayısı",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            SizedBox(
                                              // ignore: sort_child_properties_last
                                              child: Container(
                                                  color: Colors.grey[300]),
                                              height: 1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 27.0),
                                              child: Text(
                                                "Brüt Tutar",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            SizedBox(
                                              // ignore: sort_child_properties_last
                                              child: Container(
                                                  color: Colors.grey[300]),
                                              height: 1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 27.0),
                                              child: Text(
                                                "Stopaj",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            SizedBox(
                                              // ignore: sort_child_properties_last
                                              child: Container(
                                                  color: Colors.grey[300]),
                                              height: 1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 27.0),
                                              child: Text(
                                                "KDV",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            SizedBox(
                                              // ignore: sort_child_properties_last
                                              child: Container(
                                                  color: Colors.grey[300]),
                                              height: 1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 27.0),
                                              child: Text(
                                                "Net Kazanç",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                            SizedBox(
                                              // ignore: sort_child_properties_last
                                              child: Container(
                                                  color: Colors.grey[300]),
                                              height: 1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 27.0),
                                              child: Text(
                                                "Toplam Alacak",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              child: Container(
                                                  color: Colors.white),
                                              height: 0,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  2,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.41,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                27.0, 16, 0, 0),
                                            child: Text(
                                              snapshot.data!.donem,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          SizedBox(
                                            // ignore: sort_child_properties_last
                                            child: Container(
                                                color: Colors.grey[300]),
                                            height: 1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 27.0),
                                            child: Text(
                                              snapshot.data!.islem,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          SizedBox(
                                            // ignore: sort_child_properties_last
                                            child: Container(
                                                color: Colors.grey[300]),
                                            height: 1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 27.0),
                                            child: Text(
                                              snapshot.data!.brut,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          SizedBox(
                                            // ignore: sort_child_properties_last
                                            child: Container(
                                                color: Colors.grey[300]),
                                            height: 1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 27.0),
                                            child: Text(
                                              snapshot.data!.stopaj,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          SizedBox(
                                            // ignore: sort_child_properties_last
                                            child: Container(
                                                color: Colors.grey[300]),
                                            height: 1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 27.0),
                                            child: Text(
                                              snapshot.data!.kdv,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          SizedBox(
                                            // ignore: sort_child_properties_last
                                            child: Container(
                                                color: Colors.grey[300]),
                                            height: 1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 27.0),
                                            child: Text(
                                              snapshot.data!.netkazanc,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                          SizedBox(
                                            // ignore: sort_child_properties_last
                                            child: Container(
                                                color: Colors.grey[300]),
                                            height: 1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 27.0),
                                            child: Text(
                                              snapshot.data!.netkazanc,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(
                                            child:
                                                Container(color: Colors.white),
                                            height: 0,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ])))
                : Center(child: CircularProgressIndicator())));
  }
}
