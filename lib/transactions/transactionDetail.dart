import 'dart:io';

import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fu_mobile/entity/Get_Mobile_App_ActionsV2.dart';
import 'package:fu_mobile/services/Get_Mobile_App_ActionsV2Service.dart';
import 'package:fu_mobile/services/getWorkFollowDetailXmlV2Service.dart';
import 'package:fu_mobile/transactions/mortgage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fu_mobile/entity/GetWorkFollowDetailXmlV2.dart';
import '../utilities/constant.dart';

// ignore: camel_case_types
class TransactionDetail extends StatefulWidget {
  final String furefno;
  final String num;
  const TransactionDetail({Key? key, required this.furefno, required this.num})
      : super(key: key);
  @override
  State<TransactionDetail> createState() => _detailState();
}

// ignore: camel_case_types
class _detailState extends State<TransactionDetail> {
  List<Log2> appActions = [];
  File? image;
  // ignore: unused_field
  String? _imagePath;
  Future<void> getImage() async {
    String? imagePath;
    try {
      imagePath = (await EdgeDetection.detectEdge);
    } on PlatformException catch (e) {
      imagePath = e.toString();
    }
    if (!mounted) return;
    setState(() {
      _imagePath = imagePath;
    });
  }

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Failed to pick Image: $e");
    }
  }

  @override
  void initState() {
    Get_Mobile_App_ActionsV2(widget.furefno).then(
      (value) => appActions = value,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text("İşlem detay", style: TextStyle(color: primaryBrand)),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
              child: SizedBox(
                width: 24,
                height: 20,
                child: IconButton(
                  icon: Icon(
                    Icons.mail,
                    color: primaryBrand,
                  ),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
        body: FutureBuilder<Log>(
          future: getWorkFollowDetailXmlV2(widget.furefno, widget.num),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data!;
              return futureBody(context, data, widget.furefno, appActions);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}

SingleChildScrollView futureBody(context, Log data, furefno, appActions) =>
    SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: bgColor),
        child: Center(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0.0),
              child: Container(
                width: 327,
                height: 32,
                // ignore: sort_child_properties_last
                child: Center(
                    child: Text(
                  "DEĞİŞTİRİLECEK",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.red,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10, 265.0, 0.0),
              child: Text(
                "Şartlı U.N",
                style: TextStyle(color: primaryGray),
              ),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: headColor,
                  hintText: data.SartliUN,
                  hintStyle: TextStyle(fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10, 267.0, 0.0),
              child: Text(
                "Müşteri",
                style: TextStyle(color: primaryGray),
              ),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: headColor,
                  hintText: data.Musteri,
                  hintStyle: TextStyle(fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10, 275.0, 0.0),
              child: Text(
                "Malik",
                style: TextStyle(color: primaryGray),
              ),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: headColor,
                  hintText: data.Malik,
                  hintStyle: TextStyle(fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10, 300.0, 0.0),
              child: Text(
                "İl",
                style: TextStyle(color: primaryGray),
              ),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: headColor,
                  hintText: data.Il,
                  hintStyle: TextStyle(fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10, 295.0, 0.0),
              child: Text(
                "İlçe",
                style: TextStyle(color: primaryGray),
              ),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: headColor,
                  hintText: data.Ilce,
                  hintStyle: TextStyle(fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10, 265.0, 0.0),
              child: Text(
                "Mahalle",
                style: TextStyle(color: primaryGray),
              ),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: headColor,
                  hintText: data.Mahalle,
                  hintStyle: TextStyle(fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10, 295.0, 0.0),
              child: Text(
                "Ada",
                style: TextStyle(color: primaryGray),
              ),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: headColor,
                  hintText: data.Ada,
                  hintStyle: TextStyle(fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10, 235.0, 0.0),
              child: Text(
                "Randevu Tarihi",
                style: TextStyle(color: primaryGray),
              ),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: headColor,
                  hintText: data.RandTarihi,
                  hintStyle: TextStyle(fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10, 255.0, 0.0),
              child: Text(
                "Cep Tel No",
                style: TextStyle(color: primaryGray),
              ),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: headColor,
                  hintText: data.CepTel,
                  hintStyle: TextStyle(fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10, 185.0, 0.0),
              child: Text(
                "En Erken İpotek Tarihi",
                style: TextStyle(color: primaryGray),
              ),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: headColor,
                  hintText: data.EnErkenIpotek,
                  hintStyle: TextStyle(fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10, 264.0, 0.0),
              child: Text(
                "Sorumlu",
                style: TextStyle(color: primaryGray),
              ),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: headColor,
                  hintText: data.Sorumlu,
                  hintStyle: TextStyle(fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10, 300.0, 0.0),
              child: Text(
                "Çek",
                style: TextStyle(color: primaryGray),
              ),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: headColor,
                  hintText: data.Cek,
                  hintStyle: TextStyle(fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10, 223.0, 0.0),
              child: Text(
                "Randevu Sahibi",
                style: TextStyle(color: primaryGray),
              ),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: headColor,
                  hintText: data.RandSahibi,
                  hintStyle: TextStyle(fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 10, 210.0, 0.0),
              child: Text(
                "Banka Açıklaması",
                style: TextStyle(color: primaryGray),
              ),
            ),
            SizedBox(
              width: 320,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: headColor,
                  hintText: data.BankaAciklamasi,
                  hintStyle: TextStyle(fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 40, 0.0, 0.0),
              child: Container(
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
                              showAlertDialog(context, appActions);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(
                                    child: Text(
                                  "YAPILACAK İŞLEMİ SEÇ",
                                  style: TextStyle(fontSize: 20),
                                )),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );

showAlertDialog(BuildContext context, List<Log2> appActions) {
  print(appActions[0].Adi);
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Mortgage()),
                  );
                },
              ),
            ),
          ],
        ),
      );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    content: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: appActions.length,
          itemBuilder: ((context, index) =>
              okButton(appActions[index].Adi, index)),
        ),
      ),
    ),
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
