import 'dart:io';
import 'dart:async';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utilities/constant.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io' as Io;
import 'detail.dart';
import 'package:path_provider_windows/path_provider_windows.dart';

// ignore: camel_case_types
class delivery extends StatefulWidget {
  const delivery({Key? key}) : super(key: key);
  @override
  State<delivery> createState() => _deliveryState();
}

String base64Encode(List<int> bytes) => base64.encode(bytes);

// ignore: camel_case_types
class _deliveryState extends State<delivery> {
  File? image;
  // ignore: unused_field
  String? _imagePath;
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
      _imagePath = imagePath;
    });
  }

  //get image from gallery
  Future pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print("Failed to pick Image: $e");
    }
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

  TextEditingController dateinput = TextEditingController();
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
            }),
        backgroundColor: headColor,
        title: Text("Evrak Teslim", style: TextStyle(color: primaryBrand)),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: bgColor),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: primaryBrand,
                          width: 1.0,
                        )),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                      child: TextField(
                        controller: dateinput,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.calendar_today,
                            color: primaryBrand,
                          ),
                          hintText: "Tarih seçiniz",
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            setState(() {
                              dateinput.text = formattedDate;
                            });
                          } else {}
                        },
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(30, 15, 15, 30),
                child: SizedBox(
                  width: 327,
                  height: 48,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: primaryBrand,
                      ),
                      onPressed: () {
                        getImage();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
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
                                "Fotoğraf çek",
                                style: TextStyle(fontSize: 20),
                              )),
                        ],
                      )),
                ),
              ),
              Visibility(
                visible: _imagePath != null,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.file(
                      File(_imagePath ?? ''),
                    ),
                  ),
                ),
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.2,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text(
      "Tamam",
      style: TextStyle(fontSize: 18, color: okColor),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (constext) => detail(),
        ),
      );
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    content: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: Text(
        "Dosyanız başarıyla gönderilmiştir.",
        style: TextStyle(fontSize: 14),
      ),
    ),
    actions: [
      Column(
        children: [
          Container(
            width: 500,
            height: 0.5,
            color: Colors.black26,
          ),
          okButton,
        ],
      )
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Container bottom(context) => Container(
      width: MediaQuery.of(context).size.width,
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
                    showAlertDialog(context);
                  },
                  child: SizedBox(
                      width: 124,
                      height: 24,
                      child: Text(
                        "Gönder",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ))),
            ),
          ),
        ],
      ),
    );
