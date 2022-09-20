import 'package:flutter/material.dart';
import 'package:fu_mobile/reporting/deedTransactions.dart';
import 'package:fu_mobile/reporting/transactionReport.dart';

import '../utilities/constant.dart';

// ignore: camel_case_types
class reporting extends StatefulWidget {
  const reporting({Key? key}) : super(key: key);

  @override
  State<reporting> createState() => _reportingState();
}

// ignore: camel_case_types
class _reportingState extends State<reporting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Text("Raporlama", style: TextStyle(color: primaryBrand)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: bgColor,
        ),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 14.0, 0.0, 0.0),
                    child: Text(
                      "İşlem Raporu",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Padding(
                      padding: EdgeInsets.fromLTRB(25.0, 14.0, 25.0, 0.0),
                      child: IconButton(
                        iconSize: 30,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => transactionReport()));
                          // Navigator.pushReplacement(
                          //   //Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => transactionReport()),
                          // );
                        },
                        icon: Icon(Icons.keyboard_arrow_right),
                      )),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 1,
                  color: primaryGray,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 14.0, 0.0, 0.0),
                    child: Text(
                      "Aylık Tapu işlem Adetleri- Önceki Yıl",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 14.0, 25.0, 0.0),
                      child: IconButton(
                        iconSize: 30,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => deedTransactions()));
                          // Navigator.pushReplacement(
                          //   //Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => deedTransactions()),
                          // );
                        },
                        icon: Icon(Icons.keyboard_arrow_right),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
