import 'package:flutter/material.dart';
import 'package:fu_mobile/deals/deals.dart';
import 'package:fu_mobile/documents/delivery.dart';
import 'package:fu_mobile/notifications/notifications.dart';
import 'package:fu_mobile/permission/myPermissions.dart';
import 'package:fu_mobile/pleceholders/myAppointments.dart';
import 'package:fu_mobile/reporting/reporting.dart';
import 'package:fu_mobile/transactions/transactionDetail.dart';
import 'package:fu_mobile/transactions/viewTransactions.dart';
import 'package:fu_mobile/utilities/constant.dart';
import 'package:fu_mobile/visits/visits.dart';

// ignore: camel_case_types
class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

// ignore: camel_case_types
class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var buttonWidth = MediaQuery.of(context).size.width * 0.8;
    var padding2 = Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: SizedBox(
        width: 330,
        height: 40,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: headColor),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => reporting()),
              );
            },
            child: Row(
              children: const [
                Icon(
                  Icons.image_sharp,
                  color: primaryBrand,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50.0, 0.0, 120.0, 0.0),
                  child: Text(
                    "Raporlama",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                Text(
                  "12",
                  style: TextStyle(color: primaryBrand, fontSize: 16),
                )
              ],
            )),
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: Container(
        height: 1,
      ),
      appBar: AppBar(
          backgroundColor: headColor,
          //LEADİNG
          leadingWidth: 110,
          leading: Center(
            child: TextButton(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      right: 2,
                      left: 5,
                    ),
                    child: Image.asset(
                      'assets/images/leading_icon.png',
                      width: 35,
                      height: 30,
                    ),
                  ),
                  const Text(
                    'İpuçları',
                    style: TextStyle(
                      color: primaryGray,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                // ignore: avoid_print
                print('Button1');
              },
            ),
          ),

          //TİTLE
          title: Image.asset(
            'assets/images/fu_logo.png',
            height: 92,
            width: 92,
          ),

          //ACTİONS
          actions: <Widget>[
            Center(
              child: TextButton(
                child: Row(
                  children: [
                    const Text(
                      'Kılavuz',
                      style: TextStyle(
                        color: primaryGray,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          right: 5,
                          left: 5,
                        ),
                        child: Image.asset(
                          'assets/images/action_icon.png',
                          width: 35,
                          height: 30,
                        ))
                  ],
                ),
                onPressed: () {
                  // ignore: avoid_print
                  print('Button2');
                },
              ),
            ),
          ]),
      body: Container(
        color: bgColor,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(110.0, 30.0, 0.0, 0.0),
                child: Row(
                  children: const [
                    Text(
                      "Sayın ",
                      style: TextStyle(fontSize: 16, color: primaryGray),
                    ),
                    Text(
                      "Test Kullanıcısı",
                      style: TextStyle(fontSize: 16, color: primaryBrand),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 30.0, 0.0),
                child: Text(
                  "Lütfen işleminizi seçiniz.",
                  style: TextStyle(color: primaryGray),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.72,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height:
                              MediaQuery.of(context).size.height * 0.72 / 10 -
                                  2,
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: headColor),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ViewTransactions()));
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.list_alt_outlined,
                                    color: primaryBrand,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        50.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      "İşlemleri Görüntüle",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      "2",
                                      style: TextStyle(
                                          color: primaryBrand, fontSize: 16),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: SizedBox(
                          width: buttonWidth,
                          height:
                              MediaQuery.of(context).size.height * 0.72 / 10 -
                                  2,
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: headColor),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => delivery()),
                                );
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.send_to_mobile,
                                    color: primaryBrand,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.127,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text(
                                          "Evrak Teslimi\nGönderilicek İşlemler",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                        ),
                                        Visibility(
                                            visible: false, child: Text('')),
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: SizedBox(
                          width: buttonWidth,
                          height:
                              MediaQuery.of(context).size.height * 0.72 / 10 -
                                  2,
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: headColor),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => notifications()),
                                );
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.notifications_none,
                                    color: primaryBrand,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        50.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      "Bildirimler",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      "30",
                                      style: TextStyle(
                                          color: primaryBrand, fontSize: 16),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: SizedBox(
                          width: buttonWidth,
                          height:
                              MediaQuery.of(context).size.height * 0.72 / 10 -
                                  2,
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: headColor),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => myPermissions()),
                                );
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.date_range,
                                    color: primaryBrand,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        50.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      "İzin Girişi",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                  Text(
                                    " ",
                                    style: TextStyle(
                                        color: primaryBrand, fontSize: 16),
                                  )
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: SizedBox(
                          width: buttonWidth,
                          height:
                              MediaQuery.of(context).size.height * 0.72 / 10 -
                                  2,
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: headColor),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => myAppointment()),
                                );
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.format_list_numbered_sharp,
                                    color: primaryBrand,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        50.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      "Randevularım",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      "2",
                                      style: TextStyle(
                                          color: primaryBrand, fontSize: 16),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: SizedBox(
                          width: buttonWidth,
                          height:
                              MediaQuery.of(context).size.height * 0.72 / 10 -
                                  2,
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: headColor),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => visits()),
                                );
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: primaryBrand,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        50.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      "Ziyaretler",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: SizedBox(
                          width: buttonWidth,
                          height:
                              MediaQuery.of(context).size.height * 0.72 / 10 -
                                  2,
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: headColor),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => reporting()),
                                );
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.report,
                                    color: primaryBrand,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        50.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      "Raporlarım",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                  Text(
                                    " ",
                                    style: TextStyle(
                                        color: primaryBrand, fontSize: 16),
                                  )
                                ],
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                        child: SizedBox(
                          width: buttonWidth,
                          height:
                              MediaQuery.of(context).size.height * 0.72 / 10 -
                                  2,
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: headColor),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => deals()),
                                );
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.list_outlined,
                                    color: primaryBrand,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        50.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      "Mutabakatlarım",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      "2",
                                      style: TextStyle(
                                          color: primaryBrand, fontSize: 16),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      //   child: SizedBox(
                      //     width: buttonWidth,
                      //     height: 40,
                      //     child: ElevatedButton(
                      //         style:
                      //             ElevatedButton.styleFrom(primary: headColor),
                      //         onPressed: () {},
                      //         child: Row(
                      //           children: const [
                      //             Icon(
                      //               Icons.format_list_numbered_sharp,
                      //               color: primaryBrand,
                      //             ),
                      //             Padding(
                      //               padding: EdgeInsets.fromLTRB(
                      //                   50.0, 0.0, 0.0, 0.0),
                      //               child: Text(
                      //                 "Gönderilmeyen İşlemler",
                      //                 style: TextStyle(
                      //                     fontSize: 16, color: Colors.black),
                      //               ),
                      //             ),
                      //             Text(
                      //               "",
                      //               style: TextStyle(
                      //                   color: primaryBrand, fontSize: 16),
                      //             )
                      //           ],
                      //         )),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
