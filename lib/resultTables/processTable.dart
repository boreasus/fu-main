// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fu_mobile/services/GetIsTakibiCountWithDisAvukatTcImeiNoOfThisMonthService.dart';
import 'package:fu_mobile/entity/GetIsTakibiCountWithDisAvukatTcImeiNoOfThisMonth.dart';
import '../utilities/constant.dart';

// ignore: camel_case_types
class processTable extends StatefulWidget {
  const processTable({Key? key}) : super(key: key);

  @override
  State<processTable> createState() => _processTableState();
}

// ignore: camel_case_types
class _processTableState extends State<processTable> {
  var selectedBank = 0;

  showAlertDialog(
    BuildContext context,
    List<Log> data,
  ) {
    Widget okButton(islem, index) => SizedBox(
          child: Column(
            children: [
              Container(
                width: 200,
                height: index != 0 ? 1 : 0,
                color: Colors.black26,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: TextButton(
                  child: Text(
                    islem,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedBank = index;
                    });
                    Navigator.pop(
                      context,
                    );
                  },
                ),
              ),
            ],
          ),
        );

    AlertDialog alert = AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        content: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: ((context, index) =>
                  okButton(data[index].BankaAdi.toString(), index)),
            ),
          ),
        ));

    // Create AlertDialog
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget tablebox(color, text) {
    return Container(
      // her bi kutu
      color: color == 0
          ? primaryBrand
          : color == 1
              ? Colors.white
              : Color.fromARGB(59, 205, 171, 19),
      height: MediaQuery.of(context).size.height * 0.65 / 13,
      width: ((MediaQuery.of(context).size.width - 48) / 2) - 1.7,
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: color == 0 ? Colors.white : Colors.black),
      )),
    );
  }

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
          child: Text("${DateTime.now().year.toString()} İşlem Tablosu",
              style: TextStyle(color: primaryBrand)),
        ),
      ),
      body: Container(
        color: bgColor,
        child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: FutureBuilder<List<Log>>(
              future: GetIsTakibiCountWithDisAvukatTcImeiNoOfThisMonth(
                  "A8B4084027"),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var data = snapshot.data;

                  return snapshot.hasData
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child:
                              // ignore: prefer_const_literals_to_create_immutables
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                Text(
                                  'Banka Seçiniz',
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: 16,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      showAlertDialog(context, data!);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(7))),
                                      height: 45,
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Text(
                                                data![selectedBank].BankaAdi,
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 16.0),
                                                child: Icon(
                                                    Icons.keyboard_arrow_right),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 24.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.65,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            tablebox(0, "Ay"),
                                            tablebox(1, "Ocak"),
                                            tablebox(2, "Şubat"),
                                            tablebox(1, "Mart"),
                                            tablebox(2, "Nisan"),
                                            tablebox(1, "Mayıs"),
                                            tablebox(2, "Haziran"),
                                            tablebox(1, "Temmuz"),
                                            tablebox(2, "Ağustos"),
                                            tablebox(1, "Eylül"),
                                            tablebox(2, "Ekim"),
                                            tablebox(1, "Kasım"),
                                            tablebox(2, "Aralık"),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Column(
                                          children: [
                                            tablebox(0, "Islem Sayisi"),
                                            tablebox(
                                                1, data[selectedBank].Ocak),
                                            tablebox(
                                                2, data[selectedBank].Subat),
                                            tablebox(
                                                1, data[selectedBank].Mart),
                                            tablebox(
                                                2, data[selectedBank].Nisan),
                                            tablebox(
                                                1, data[selectedBank].Mayis),
                                            tablebox(
                                                2, data[selectedBank].Haziran),
                                            tablebox(
                                                1, data[selectedBank].Temmuz),
                                            tablebox(
                                                2, data[selectedBank].Agustos),
                                            tablebox(
                                                1, data[selectedBank].Eylul),
                                            tablebox(
                                                2, data[selectedBank].Ekim),
                                            tablebox(
                                                1, data[selectedBank].Kasim),
                                            tablebox(
                                                2, data[selectedBank].Aralik),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        )
                      : Container(
                          child:
                              Center(child: Text('Herhangi bir veriniz yok.')),
                        );
                } else {
                  return Center(
                    child: Container(child: CircularProgressIndicator()),
                  );
                }
              }),
            )),
      ),
    );
  }
}
