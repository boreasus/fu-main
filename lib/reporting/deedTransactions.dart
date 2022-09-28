// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../utilities/constant.dart';
import 'package:fu_mobile/entity/GetCountOfLastYearFromTapuDairesi.dart';
import 'package:fu_mobile/services/GetCountOfLastYearFromTapuDairesiService.dart';

// ignore: camel_case_types
class deedTransactions extends StatefulWidget {
  const deedTransactions({Key? key}) : super(key: key);
  @override
  State<deedTransactions> createState() => _deedTransactionsState();
}

// ignore: camel_case_types
class _deedTransactionsState extends State<deedTransactions> {
  Widget tableRow(bankaAdi, subeAdi, islemAdedi, index) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1.05 / 3 - 1,
            height: 30,
            color: index % 2 != 0
                ? Color.fromRGBO(137, 113, 1, 0.40)
                : Colors.white,
            child: Center(
                child: Text(
              bankaAdi,
              style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
            )),
          ),
          SizedBox(
            width: 1,
            child: Container(color: gryColor),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9 / 3 - 1,
            height: 30,
            color: index % 2 != 0
                ? Color.fromRGBO(137, 113, 1, 0.40)
                : Colors.white,
            child: Center(
                child: Text(
              subeAdi,
              style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
            )),
          ),
          SizedBox(
            width: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.6 / 3,
            height: 30,
            color: index % 2 != 0
                ? Color.fromRGBO(137, 113, 1, 0.40)
                : Colors.white,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  islemAdedi,
                  style: TextStyle(color: Colors.black, fontFamily: 'Inter'),
                  textAlign: TextAlign.center,
                ),
              ],
            )),
          ),
        ],
      );

  var islemAdedi = [1, 2, 3, 4, 5];
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  TextStyle headerTextStyle = TextStyle(color: Colors.white, fontSize: 20);

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
            child: Text("Aylık Tapu İşlem Adetleri\nÖnceki Yıl",
                textAlign: TextAlign.center,
                style: TextStyle(color: primaryBrand)),
          ),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 1.05 / 3 - 1,
                        height: 50,
                        color: primaryBrand,
                        child: Center(
                            child: Text(
                          'Banka Adı',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Inter'),
                        )),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9 / 3 - 1,
                        height: 50,
                        color: primaryBrand,
                        child: Center(
                            child: Text(
                          'Şube Adı',
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Inter'),
                        )),
                      ),
                      SizedBox(
                        width: 1,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6 / 3,
                        height: 50,
                        color: primaryBrand,
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              'İşlem Adedi',
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Inter'),
                              textAlign: TextAlign.center,
                            ),
                            Flexible(
                              child: Text(
                                '(Geçen Yıl Aynı Ay)',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontSize: 11),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                  FutureBuilder<List<Log>>(
                    future: getCountOfLastYearFromTapuDairesi('A8B4084027'),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          print("aaaaaaaaaaa ${snapshot.data![0].Adet}");
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                List<Log> data = snapshot.data!;
                                print(
                                    "aaaaaaaaZZZ ${data[index].New_BankaIdName}");

                                return tableRow(
                                    data[index].New_anabankaidName,
                                    data[index].New_BankaIdName,
                                    data[index].Adet,
                                    index);
                              },
                            ),
                          );
                        } else {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return tableRow("Herhangi bir veriniz",
                                    "bulunmamaktadır.", "/", 1);
                              },
                            ),
                          );
                        }
                      } else
                        return Container(
                          height: 100,
                          child: Center(child: CircularProgressIndicator()),
                        );
                    }),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
