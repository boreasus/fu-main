import 'dart:io';
import 'dart:async';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/constant.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io' as Io;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:async';

class Mortgage extends StatefulWidget {
  const Mortgage({Key? key}) : super(key: key);

  @override
  State<Mortgage> createState() => _MortgageState();
}

class _MortgageState extends State<Mortgage> {
  File? image;
  var photoArray = [];

  // ignore: unused_field
  Future<void> getImage() async {
    String? imagePath;
    try {
      imagePath = (await EdgeDetection.detectEdge);
      print("aha da bu çalıştı $imagePath ");

      // final bytes = File(imagePath!).readAsBytesSync();
      // String base64Image = base64Encode(bytes);
      // debugPrint("base64image'imiz3: " + base64Image, wrapWidth: 20000);
      final bytes = await Io.File(imagePath!).readAsBytes();
      dev.log(base64Encode(bytes) + "***", name: 'log');

      print("//aaaaaa/");
    } on PlatformException catch (e) {
      imagePath = e.toString();
    }
    if (!mounted) return;
    setState(() {
      photoArray.add(imagePath);
    });
  }

  Future<void> ChangePhoto(index) async {
    String? imagePath;
    try {
      imagePath = (await EdgeDetection.detectEdge);
      print("aha da bu çalıştı $imagePath ");

      // final bytes = File(imagePath!).readAsBytesSync();
      // String base64Image = base64Encode(bytes);
      // debugPrint("base64image'imiz3: " + base64Image, wrapWidth: 20000);
      final bytes = await Io.File(imagePath!).readAsBytes();
      dev.log(base64Encode(bytes) + "***", name: 'log');

      print("//aaaaaa/");
    } on PlatformException catch (e) {
      imagePath = e.toString();
    }
    if (!mounted) return;
    setState(() {
      photoArray[index] = imagePath;
    });
  }

  Padding photoCard(context, photoUrl, index) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 0, 0, 12),
      child: Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        key: UniqueKey(),
        onDismissed: (direction) {
          setState(() {
            photoArray.removeAt(index);
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 4.0),
                    blurRadius: 7.0)
              ],
              // borderRadius: BorderRadius.all(Radius.circular(500))),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.15,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  width: 80,
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: InkWell(
                    onTap: () => showDialog(
                        builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Colors.transparent,
                              insetPadding: EdgeInsets.all(2),
                              title: Container(
                                decoration: BoxDecoration(),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: Expanded(
                                  child: InkWell(
                                    onTap: (() => Navigator.pop(context)),
                                    child: Image.file(
                                      File(photoArray[index] ?? ''),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        context: context),
                    child: Image.file(
                      File(photoArray[index] ?? ''),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: InkWell(
                    onTap: () {
                      ChangePhoto(index);
                    },
                    child: Icon(Icons.transform_rounded)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: GestureDetector(
                  onTap: (() {}),
                  child: Icon(
                    Icons.delete_outlined,
                    color: Colors.red,
                    size: 34,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container bottom(context) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.22,
        color: headColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 15, 0, 0),
              child: SizedBox(
                width: 290,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.green, width: 1),
                      primary: Colors.green,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Hemen Gönder",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ),
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
                      getImage();
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
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: bottom(context),
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
        title: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0, 0, 0),
          child: Text("İpotek", style: TextStyle(color: primaryBrand)),
        ),
      ),
      body: Center(
        child: Container(
          color: bgColor,
          child: Center(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Center(
                      child: Text(
                    "Test Müşterisi İsim Soyisim",
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24, 8.0, 24, 24),
                    child: Text(
                      textAlign: TextAlign.center,
                      "          Fotoğrafları büyütmek için fotoğraf simgelerine tıklayabilirsiniz.\nGöndermek istemediğiniz fotoğrafları çöp kutusu simgesine tıklayarak silebilirsiniz.",
                      style: TextStyle(color: textColor),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.92,
                  height: MediaQuery.of(context).size.height * 0.46,
                  child: ListView.builder(
                    itemCount: photoArray.length,
                    itemBuilder: ((context, index) {
                      return photoCard(context, photoArray[index], index);
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
