// ignore_for_file: file_names
import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:developer' as dev;
import 'dart:io' as Io;
import 'package:edge_detection/edge_detection.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import '../utilities/constant.dart';

// ignore: camel_case_types
class pendingDeals extends StatefulWidget {
  final String donem;
  final String islemSayisi;
  final String brutTutar;
  final String stopaj;
  final String kdv;
  final String netKazanc;
  final String toplamAlacak;
  const pendingDeals(
      {Key? key,
      required this.donem,
      required this.islemSayisi,
      required this.brutTutar,
      required this.stopaj,
      required this.kdv,
      required this.netKazanc,
      required this.toplamAlacak})
      : super(key: key);

  @override
  State<pendingDeals> createState() => _pendingDealsState();
}

// ignore: camel_case_types
class _pendingDealsState extends State<pendingDeals> {
  TextEditingController dateinput = TextEditingController();

  File? image;
  var photoArray = [];
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

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        photoArray.add((pickedFile.path));
      });
    }
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

  Widget bottomMenu() => Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        color: headColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 52,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: primaryBrand,
                    ),
                    onPressed: () {
                      showAlertDialogTrue(context);
                    },
                    child: Center(
                        child: Text(
                      "Gönder",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17),
                    ))),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomSheet: bottomMenu(),
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
            Navigator.pop(context);
          },
        ),
        backgroundColor: headColor,
        title: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Text("Bekleyen Mutabakatlarım",
              textAlign: TextAlign.center,
              style: TextStyle(color: primaryBrand)),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        color: bgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.43,
                decoration: BoxDecoration(color: headColor),
                child: Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height * 0.41,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(27.0, 16, 0, 0),
                                child: Text(
                                  "Dönem",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                // ignore: sort_child_properties_last
                                child: Container(color: Colors.grey[300]),
                                height: 1,
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 27.0),
                                child: Text(
                                  "İşlem Sayısı",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                // ignore: sort_child_properties_last
                                child: Container(color: Colors.grey[300]),
                                height: 1,
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 27.0),
                                child: Text(
                                  "Brüt Tutar",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                // ignore: sort_child_properties_last
                                child: Container(color: Colors.grey[300]),
                                height: 1,
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 27.0),
                                child: Text(
                                  "Stopaj",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                // ignore: sort_child_properties_last
                                child: Container(color: Colors.grey[300]),
                                height: 1,
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 27.0),
                                child: Text(
                                  "KDV",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                // ignore: sort_child_properties_last
                                child: Container(color: Colors.grey[300]),
                                height: 1,
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 27.0),
                                child: Text(
                                  "Net Kazanç",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                // ignore: sort_child_properties_last
                                child: Container(color: Colors.grey[300]),
                                height: 1,
                                width: MediaQuery.of(context).size.width * 0.5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 27.0),
                                child: Text(
                                  "Toplam Alacak",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                child: Container(color: Colors.white),
                                height: 0,
                                width: MediaQuery.of(context).size.height / 2,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height * 0.41,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(27.0, 16, 0, 0),
                              child: Text(
                                widget.donem,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              // ignore: sort_child_properties_last
                              child: Container(color: Colors.grey[300]),
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 27.0),
                              child: Text(
                                widget.islemSayisi,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              // ignore: sort_child_properties_last
                              child: Container(color: Colors.grey[300]),
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 27.0),
                              child: Text(
                                widget.brutTutar,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              // ignore: sort_child_properties_last
                              child: Container(color: Colors.grey[300]),
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 27.0),
                              child: Text(
                                widget.stopaj,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              // ignore: sort_child_properties_last
                              child: Container(color: Colors.grey[300]),
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 27.0),
                              child: Text(
                                widget.kdv,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              // ignore: sort_child_properties_last
                              child: Container(color: Colors.grey[300]),
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 27.0),
                              child: Text(
                                widget.netKazanc,
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              // ignore: sort_child_properties_last
                              child: Container(color: Colors.grey[300]),
                              height: 1,
                              width: MediaQuery.of(context).size.width * 0.5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 27.0),
                              child: Text(
                                widget.netKazanc,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              child: Container(color: Colors.white),
                              height: 0,
                              width: MediaQuery.of(context).size.height / 2,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 25.0, 0, 0.0),
              child: Text(
                "Makbuz Tarihi",
                style: TextStyle(color: primaryGray, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 8, 0, 0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: headColor,
                    border: Border.all(color: primaryGray)),
                width: MediaQuery.of(context).size.width - 50,
                height: 50,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 0.0, 0, 0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 70,
                        height: 50,
                        child: TextField(
                          controller: dateinput,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.calendar_today,
                                color: primaryBrand,
                              ),
                              hintText: "Tarih Seçiniz",
                              hintStyle: TextStyle(color: primaryGray)),
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
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 25.0, 0, 0.0),
              child: Text(
                "Makbuz No",
                style: TextStyle(color: primaryGray, fontSize: 14),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 8.0, 0.0, 0.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: primaryGray),
                    borderRadius: BorderRadius.circular(5),
                    color: headColor),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 70,
                    height: 30,
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Makbuz No Giriniz",
                          hintStyle: TextStyle(color: primaryGray)),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25.0, 25.0, 0, 0.0),
              child: Text(
                "Makbuz Ekle",
                style: TextStyle(color: primaryGray, fontSize: 14),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  25, photoArray.isEmpty ? 0.0 : 20.0, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.92,
                height: photoArray.isNotEmpty
                    ? MediaQuery.of(context).size.height *
                        0.17 *
                        photoArray.length
                    : 0,
                child: ListView.builder(
                  itemCount: photoArray.length,
                  itemBuilder: ((context, index) {
                    return photoCard(context, photoArray[index], index);
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 8, 0, 0),
              child: SizedBox(
                width: photoArray.isEmpty
                    ? MediaQuery.of(context).size.width - 50
                    : 0,
                height: 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: primaryBrand),
                    onPressed: () {
                      getImage();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 24.0),
                          child: Icon(Icons.camera_alt),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 49.0, 0.0),
                          child: Text(
                            "Fotoğraf çek",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Spacer(),
                      ],
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 40.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: SizedBox(
                    width: photoArray.isEmpty
                        ? MediaQuery.of(context).size.width - 50
                        : 0,
                    height: 40,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(color: primaryBrand)),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: bgColor,
                          ),
                          onPressed: () {
                            _getFromGallery();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 24.0),
                                child: Icon(
                                  Icons.browse_gallery_sharp,
                                  color: primaryBrand,
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 49.0, 0.0),
                                child: Text(
                                  "Galeriden Seç",
                                  style: TextStyle(
                                      fontSize: 20, color: primaryBrand),
                                ),
                              ),
                              Spacer(),
                            ],
                          )),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: photoArray.isEmpty ? 100 : 0,
            )
          ],
        ),
      )),
    );
  }
}

showAlertDialogTrue(BuildContext context) {
  // Create button
  Widget okButton = TextButton(
    child: Text(
      "Tamam",
      style: TextStyle(fontSize: 18, color: okColor),
    ),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    actionsAlignment: MainAxisAlignment.center,
    content: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: Text(
        "Makbuz Gönderildi.",
        textAlign: TextAlign.center,
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
