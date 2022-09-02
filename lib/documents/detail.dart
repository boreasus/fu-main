import 'dart:io';

import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../utilities/constant.dart';
import 'delivery.dart';

// ignore: camel_case_types
class detail extends StatefulWidget {
  const detail({Key? key}) : super(key: key);
  @override
  State<detail> createState() => _detailState();
}

// ignore: camel_case_types
class _detailState extends State<detail> {
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
      body: SingleChildScrollView(
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
                    "Evrak Teslimi Gönderilicek İşlemler",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.black,
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
                    hintText:
                        "İşlemde vekaletname kullanılacaksa \n FU merkeze göndermenizi rica ederiz",
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
                    hintText:
                        "İşlemde vekaletname kullanılacaksa\nFU merkeze göndermenizi rica ederiz",
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
                    hintText:
                        "İşlemde vekaletname kullanılacaksa\nFU merkeze göndermenizi rica ederiz",
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
                    hintText:
                        "İşlemde vekaletname kullanılacaksa\nFU merkeze göndermenizi rica ederiz",
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
                    hintText:
                        "İşlemde vekaletname kullanılacaksa\nFU merkeze göndermenizi rica ederiz",
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
                    hintText:
                        "İşlemde vekaletname kullanılacaksa\nFU merkeze göndermenizi rica ederiz",
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
                    hintText:
                        "İşlemde vekaletname kullanılacaksa\nFU merkeze göndermenizi rica ederiz",
                    hintStyle: TextStyle(fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10, 280.0, 0.0),
                child: Text(
                  "Parsel",
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
                    hintText:
                        "İşlemde vekaletname kullanılacaksa\nFU merkeze göndermenizi rica ederiz",
                    hintStyle: TextStyle(fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10, 265.0, 0.0),
                child: Text(
                  "Arsa Payı",
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
                    hintText:
                        "İşlemde vekaletname kullanılacaksa\nFU merkeze göndermenizi rica ederiz",
                    hintStyle: TextStyle(fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey)),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10, 275.0, 0.0),
                child: Text(
                  "Kat No",
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
                    hintText:
                        "İşlemde vekaletname kullanılacaksa\nFU merkeze göndermenizi rica ederiz",
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
                  height: 162,
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
                                //getImage();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (constext) => delivery(),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                                    child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Icon(Icons.photo_camera)),
                                  ),
                                  SizedBox(
                                      width: 124,
                                      height: 24,
                                      child: Text(
                                        "Fotoğraf Ekle",
                                        style: TextStyle(fontSize: 20),
                                      )),
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 290,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(color: primaryBrand, width: 1),
                              primary: headColor,
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                                  child: Icon(
                                    Icons.not_interested,
                                    color: primaryBrand,
                                  ),
                                ),
                                Text(
                                  "Randevuyu İptal Et",
                                  style: TextStyle(
                                      color: primaryBrand, fontSize: 20),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
