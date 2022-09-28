// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fu_mobile/deals/agreementsMade.dart';
import 'package:fu_mobile/deals/completedAgreements.dart';
import '../utilities/constant.dart';
import 'package:fu_mobile/entity/AgreementDeals.dart';

class tableRights extends StatefulWidget {
  const tableRights({Key? key}) : super(key: key);

  @override
  State<tableRights> createState() => _tableRightsState();
}

// ignore: camel_case_types
class _tableRightsState extends State<tableRights> {
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
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Text("Mutabakatlarım",
              textAlign: TextAlign.center,
              style: TextStyle(color: primaryBrand)),
        ),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 28.0, 0.0, 0.0),
                    child: Text(
                      "Yapılacak Mutabakatlarım",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 28.0, 0.0, 0.0),
                    child: IconButton(
                      icon: Icon(Icons.keyboard_arrow_right),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => agreementsMade()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: primaryGray,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 28.0, 0.0, 0.0),
                    child: Text(
                      "Tamamlanan Mutabakatlarım",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 28.0, 0.0, 0.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => completedAgreements()),
                        );
                      },
                      icon: Icon(Icons.keyboard_arrow_right),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 0.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: primaryGray,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
