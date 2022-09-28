import 'dart:io';
import 'dart:async';
import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fu_mobile/services/insertAttachmentReferenceNumberPdfV2.dart';
import '../utilities/constant.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:io' as Io;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class Mortgage extends StatefulWidget {
  final String islem;
  final String no;
  final String photo;
  final String fileName;
  final String refNo;
  final String date;
  const Mortgage({
    Key? key,
    required this.islem,
    required this.no,
    required this.photo,
    required this.fileName,
    required this.refNo,
    required this.date,
  }) : super(key: key);

  @override
  State<Mortgage> createState() => _MortgageState();
}

class _MortgageState extends State<Mortgage> {
  File? image;
  var photoArray = [];
  late var temp;
  var byteEncoded = [];
  // ignore: unused_field
  Future<void> getImage() async {
    String? imagePath;
    try {
      imagePath = (await EdgeDetection.detectEdge);

      // final bytes = File(imagePath!).readAsBytesSync();
      // String base64Image = base64Encode(bytes);
      // debugPrint("base64image'imiz3: " + base64Image, wrapWidth: 20000);
      final bytes = await Io.File(imagePath!).readAsBytes();
      var result;
      if (bytes.length > 100000) {
        result = await FlutterImageCompress.compressWithFile(
          imagePath,
          quality: 50,
        );
      } else {
        result = bytes;
      }

      print("bytelar >>>> ${bytes.length} ${result!.length} , ");
      temp = base64.encode(result);
      byteEncoded.add(Uri.encodeComponent(temp));
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
      final bytes = await Io.File(imagePath!).readAsBytes();
      var result;
      if (bytes.length > 400000) {
        result = await FlutterImageCompress.compressWithFile(
          imagePath,
          quality: 50,
        );
      } else {
        result = bytes;
      }

      print("bytelar >>>> ${bytes.length} ${result!.length} , ");
      temp = base64.encode(result);
      byteEncoded[index] = Uri.encodeComponent(temp);
      print("//aaaaaa/");
    } on PlatformException catch (e) {
      imagePath = e.toString();
    }
    if (!mounted) return;
    setState(() {
      photoArray[index] = imagePath;
    });
  }

  showAlertDialogTrue(BuildContext context, basee64, date, type) {
    // Create button
    Widget okButton = TextButton(
        child: Text(
          "Tamam",
          style: TextStyle(fontSize: 18, color: okColor),
        ),
        onPressed: () {
          Navigator.pop(context);
        });

    Widget okButtonWithBackPress() => TextButton(
        child: Text(
          "Tamam",
          style: TextStyle(fontSize: 18, color: okColor),
        ),
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        });
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: Text(
          "Belgeler Gönderildi.",
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
            okButtonWithBackPress(),
          ],
        )
      ],
    );

    AlertDialog alertFail = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: Text(
          "Belgeler Gönderilmedi.",
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

    AlertDialog alertLoading = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  const Text('Belgeler yükleniyor.')
                ],
              )
            ],
          )),
    );

//getOffDaysFromUser("A8B4084027", "true", startDate.text, endDate.text);
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return FutureBuilder<String>(
            future: insertAttachmentNum(widget.refNo,
                "${widget.fileName}_${widget.refNo}.pdf", basee64, date, type),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  if (snapshot.data!.contains("OK")) {
                    return alert;
                  } else
                    return alertFail;
                } else
                  return alertFail;
              } else {
                return alertLoading;
              }
            }));
      },
    );
  }

  showAlertDialogMultiple(BuildContext context, List<Future> _futures) {
    // Create button
    Widget okButton = TextButton(
        child: Text(
          "Tamam",
          style: TextStyle(fontSize: 18, color: okColor),
        ),
        onPressed: () {
          Navigator.pop(context);
        });

    Widget okButtonWithBackPress() => TextButton(
        child: Text(
          "Tamam",
          style: TextStyle(fontSize: 18, color: okColor),
        ),
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        });
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: Text(
          "Belgeler Gönderildi.",
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
            okButtonWithBackPress(),
          ],
        )
      ],
    );

    AlertDialog alertFail = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: Text(
          "Belgeler Gönderilmedi.",
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

    AlertDialog alertLoading = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  const Text('Belgeler yükleniyor.')
                ],
              )
            ],
          )),
    );

//getOffDaysFromUser("A8B4084027", "true", startDate.text, endDate.text);
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        var controller = true;
        return FutureBuilder(
            future: Future.wait(_futures),
            builder: ((context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  for (var i = 0; i < _futures.length; i++) {
                    if (!snapshot.data[i].contains("OK")) controller = false;
                  }
                  if (controller == true) {
                    return alert;
                  } else
                    return alertFail;
                } else
                  return alertFail;
              } else {
                return alertLoading;
              }
            }));
      },
    );
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
                                child: InkWell(
                                  onTap: (() => Navigator.pop(context)),
                                  child: Image.file(
                                    File(photoArray[index] ?? ''),
                                    fit: BoxFit.fitWidth,
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
        height: 170,
        color: headColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 15, 0, 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 90,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.green, width: 1),
                    primary: Colors.green,
                  ),
                  onPressed: () async {
                    if (byteEncoded.length == 1) {
                      print("<<<>>>>${widget.date}");
                      showAlertDialogTrue(
                          context, byteEncoded[0], widget.date, widget.no);
                    } else {
                      List<Future> futures = [];
                      for (var i in byteEncoded) {
                        futures.add(insertAttachmentNum(
                            widget.refNo,
                            "${widget.fileName}_${widget.refNo}.pdf",
                            i,
                            widget.date,
                            widget.no));
                      }
                      showAlertDialogMultiple(context, futures);
                    }
                  },
                  child: Text(
                    "Hemen Gönder",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 90,
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
                        Text(
                          "Fotoğraf Ekle",
                          style: TextStyle(fontSize: 20),
                        ),
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
                  padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
                  child: Center(
                      child: Text(
                    widget.islem,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  )),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24, 8.0, 24, 24),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Fotoğrafları büyütmek için fotoğraf simgelerine tıklayabilirsiniz.\nGöndermek istemediğiniz fotoğrafları çöp kutusu simgesine tıklayarak silebilirsiniz.",
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
