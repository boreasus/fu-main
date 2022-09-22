import 'package:flutter/material.dart';
import 'package:fu_mobile/deals/tableRights.dart';
import 'package:fu_mobile/resultTables/performanceTable.dart';
import 'package:fu_mobile/resultTables/processTable.dart';

import '../utilities/constant.dart';

// ignore: camel_case_types
class deals extends StatefulWidget {
  const deals({Key? key}) : super(key: key);

  @override
  State<deals> createState() => _dealsState();
}

// ignore: camel_case_types
class _dealsState extends State<deals> {
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
          padding: EdgeInsets.fromLTRB(30.0, 0.0, .0, 0.0),
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
                      "Hakediş Tablosu",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(70.0, 28.0, 0.0, 0.0),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tableRights()),
                        );
                      },
                      icon: Icon(Icons.keyboard_arrow_right),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
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
