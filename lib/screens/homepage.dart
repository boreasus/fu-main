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
      appBar: AppBar(
          backgroundColor: headColor,
          //LEAD??NG
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
                    '??pu??lar??',
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

          //T??TLE
          title: Image.asset(
            'assets/images/fu_logo.png',
            height: 92,
            width: 92,
          ),

          //ACT??ONS
          actions: <Widget>[
            Center(
              child: TextButton(
                child: Row(
                  children: [
                    const Text(
                      'K??lavuz',
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
                      "Say??n ",
                      style: TextStyle(fontSize: 16, color: primaryGray),
                    ),
                    Text(
                      "Test Kullan??c??s??",
                      style: TextStyle(fontSize: 16, color: primaryBrand),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 5.0, 30.0, 0.0),
                child: Text(
                  "L??tfen i??leminizi se??iniz.",
                  style: TextStyle(color: primaryGray),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 10.0),
                child: SizedBox(
                  width: 330,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: headColor),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewTransactions()));
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.list_alt_outlined,
                            color: primaryBrand,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(50.0, 0.0, 60.0, 0.0),
                            child: Text(
                              "????lemleri G??r??nt??le",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Text(
                            "2",
                            style: TextStyle(color: primaryBrand, fontSize: 16),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: SizedBox(
                  width: 330,
                  height: 60,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: headColor),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => delivery()),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.send_to_mobile,
                            color: primaryBrand,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(50.0, 0.0, 30.0, 0.0),
                            child: Text(
                              "Evrak Teslimi G??nderilicek\n????lemler",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Text(
                            " ",
                            style: TextStyle(color: primaryBrand, fontSize: 16),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: SizedBox(
                  width: 330,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: headColor),
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
                            padding: EdgeInsets.fromLTRB(50.0, 0.0, 125.0, 0.0),
                            child: Text(
                              "Bildirimler",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Text(
                            "30",
                            style: TextStyle(color: primaryBrand, fontSize: 16),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: SizedBox(
                  width: 330,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: headColor),
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
                            padding: EdgeInsets.fromLTRB(50.0, 0.0, 132.0, 0.0),
                            child: Text(
                              "??zin Giri??i",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Text(
                            " ",
                            style: TextStyle(color: primaryBrand, fontSize: 16),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: SizedBox(
                  width: 330,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: headColor),
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
                            padding: EdgeInsets.fromLTRB(50.0, 0.0, 100.0, 0.0),
                            child: Text(
                              "Randevular??m",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Text(
                            "2",
                            style: TextStyle(color: primaryBrand, fontSize: 16),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: SizedBox(
                  width: 330,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: headColor),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => visits()),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.location_on_outlined,
                            color: primaryBrand,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(50.0, 0.0, 130.0, 0.0),
                            child: Text(
                              "Ziyaretler",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Text(
                            " ",
                            style: TextStyle(color: primaryBrand, fontSize: 16),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
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
                            Icons.report,
                            color: primaryBrand,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(50.0, 0.0, 132.0, 0.0),
                            child: Text(
                              "Raporlar??m",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Text(
                            " ",
                            style: TextStyle(color: primaryBrand, fontSize: 16),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: SizedBox(
                  width: 330,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: headColor),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => deals()),
                        );
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.list_outlined,
                            color: primaryBrand,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(50.0, 0.0, 87.0, 0.0),
                            child: Text(
                              "Mutabakatlar??m",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Text(
                            "2",
                            style: TextStyle(color: primaryBrand, fontSize: 16),
                          )
                        ],
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: SizedBox(
                  width: 330,
                  height: 40,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: headColor),
                      onPressed: () {},
                      child: Row(
                        children: const [
                          Icon(
                            Icons.format_list_numbered_sharp,
                            color: primaryBrand,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(50.0, 0.0, 30.0, 0.0),
                            child: Text(
                              "G??nderilmeyen ????lemler",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          Text(
                            "",
                            style: TextStyle(color: primaryBrand, fontSize: 16),
                          )
                        ],
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
