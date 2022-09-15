// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fu_mobile/services/getLawyerAppointmentsByImeiNoService.dart';
import 'package:fu_mobile/entity/getLawyerAppointmentsByImeiNo.dart';
import '../utilities/constant.dart';
import 'newAppointment.dart';

// ignore: camel_case_types
class myAppointment extends StatefulWidget {
  const myAppointment({Key? key}) : super(key: key);
  @override
  State<myAppointment> createState() => _myAppointmentState();
}

// ignore: camel_case_types
class _myAppointmentState extends State<myAppointment> {
  late Future<List<Log>> future;
  String searchString = "";

  @override
  void initState() {
    // getLawyerAppointsmentByImeiNo("A8B4084027").then((value) => future = value);
    future = getLawyerAppointsmentByImeiNo("A8B4084027");
    print("init");
    super.initState();
  }

  void filterSearchResults(String query, data) {
    // print("foundDatas $data");
  }

  Container futureBody(List<Log> data) {
    List<Log> temp = data;

    print("body çalıştı");
    return Container(
      color: bgColor,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: headColor,
                    border: Border.all(color: primaryBrand)),
                width: MediaQuery.of(context).size.width * 0.87,
                height: 50,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(13.0, 15.0, 0.0, 20.0),
                      child: Icon(
                        Icons.search,
                        color: primaryBrand,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 30,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 13.0, 0.0, 0.0),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              searchString = value.toLowerCase();
                            });
                          },
                          controller: editingController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Arama"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width * 0.85,
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    return data[index]
                            .IslemAd
                            .toLowerCase()
                            .contains(searchString)
                        ? cards(
                            data[index].IslemAd,
                            data[index].IslemTarih,
                            data[index].NewFuReferansNo,
                            data[index].NewRandevuId,
                            data[index].Sube,
                            data[index].AnaBanka,
                            data[index].IslemSaat,
                          )
                        : Container();
                  })),
            )
          ],
        ),
      ),
    );
  }

  var filteredList = List<Log>;
  TextEditingController editingController = TextEditingController();

  Container bottomButton() => Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        color: headColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                width: 300,
                height: 52,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryBrand,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const newAppointment()),
                      );
                    },
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 24,
                        child: Text(
                          "Yeni Randevu Al",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20),
                        ))),
              ),
            ),
          ],
        ),
      );

  Padding cards(islemad, islemtarih, no, id, sube, banka, saat) => Padding(
        padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
        child: Container(
          // width: MediaQuery.of(context).size.width * 0.5,
          // height: MediaQuery.of(context).size.height * 0.13,
          child: Container(
            decoration: BoxDecoration(
              color: headColor,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(18.0, 10, 0.0, 0.0),
                      child: Text(
                        "Rand. Tarihi:",
                        style: TextStyle(fontSize: 13, color: primaryGray),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(1.0, 10, 0.0, 0.0),
                      child: Text(
                        "$islemtarih-$saat",
                        style: TextStyle(color: primaryBrand, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(18, 10.0, 0, 20),
                      child: Text(
                        "$islemad",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(200.0, 20.0, 15.0, 0.0),
                //   child: Text(
                //     "22.05.2022-15.33",
                //     style: TextStyle(color: primaryGray),
                //   ),
                // )
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: 110,
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
          title: Text("Randevularım", style: TextStyle(color: primaryBrand)),
        ),
        bottomSheet: bottomButton(),
        // body: futureBody(foundDatas)
        body: FutureBuilder<List<Log>>(
            future: future,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  print("body ${snapshot.data?.isEmpty}");
                  return futureBody(snapshot.data!);
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(child: Text('Randevunuz bulunmamaktadır.')),
                  );
                }
              } else {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            })));
  }
}
