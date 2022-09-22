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
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utilities/constant.dart';
import '../services/InsertLawyerAppointmentService.dart';

// ignore: camel_case_types
class TransactionDetail extends StatefulWidget {
  final String furefno;
  final String num;
  final String dateText;
  const TransactionDetail(
      {Key? key,
      required this.furefno,
      required this.num,
      required this.dateText})
      : super(key: key);
  @override
  State<TransactionDetail> createState() => _detailState();
}

// ignore: camel_case_types
class _detailState extends State<TransactionDetail> {
  showAlertDialog(BuildContext context) {
    Widget loadingContainer() => SizedBox(
          width: 50,
          height: 50,
          child: Center(child: CircularProgressIndicator()),
        );

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
                  onPressed: islem !=
                          "İşleme atanan bankaya tanım yapılmamıştır."
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Mortgage()),
                          );
                        }
                      : (() {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        }),
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
            child: FutureBuilder<List<Log2>>(
              future: appActionsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  List<Log2> appActions = snapshot.data ?? [];
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: appActions.isEmpty ? 1 : appActions.length,
                    itemBuilder: ((context, index) => appActions.length != 0
                        ? okButton(appActions[index].Adi, index)
                        : okButton("İşleme atanan bankaya tanım yapılmamıştır.",
                            index)),
                  );
                } else {
                  return loadingContainer();
                }
              },
            )),
      ),
    );

    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  TimeOfDay selectedTime = TimeOfDay.now();

  _selectTime(BuildContext context) async {
    TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.input,
      confirmText: "Seç",
      cancelText: "İptal",
      hourLabelText: "Saat",
      minuteLabelText: "Dakika",
      helpText: "Randevu Tarihi Seçiniz",
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child ?? Container(),
        );
      },
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  showAlertDialogTrue(refno, time, year, month, day) {
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
        });
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: Text(
          "Tapu Randevu Tarihi alındı.",
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
    AlertDialog alertNOK = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child: Text(
          "Tapu Randevu Tarihi alınamadı.",
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
          "Sistemsel bir sıkıntı yaşandı. İnternet bağlantınızı kontrol edin ya da sistem yöneticinize başvurun.",
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
            alignment: WrapAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  const Text('Tapu Randevu Tarihi alınıyor.')
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
            future:
                InsertLawyerAppointmentService(refno, time, year, month, day),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  if (snapshot.data == "OK") {
                    return alert;
                  } else
                    return alertNOK;
                } else
                  return alertFail;
              } else {
                return alertLoading;
              }
            }));
      },
    );
  }

  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();
  TextEditingController c = TextEditingController();
  TextEditingController d = TextEditingController();
  TextEditingController e = TextEditingController();
  TextEditingController f = TextEditingController();
  TextEditingController g = TextEditingController();
  TextEditingController h = TextEditingController();
  TextEditingController i = TextEditingController();
  TextEditingController j = TextEditingController();
  TextEditingController k = TextEditingController();
  TextEditingController l = TextEditingController();
  TextEditingController m = TextEditingController();
  TextEditingController n = TextEditingController();
  TextEditingController p = TextEditingController();
  TextEditingController r = TextEditingController();
  TextEditingController s = TextEditingController();
  TextEditingController t = TextEditingController();
  TextEditingController u = TextEditingController();
  TextEditingController v = TextEditingController();
  TextEditingController y = TextEditingController();
  TextEditingController x = TextEditingController();
  TextEditingController z = TextEditingController();
  TextEditingController aa = TextEditingController();
  TextEditingController ab = TextEditingController();
  TextEditingController ac = TextEditingController();
  TextEditingController ad = TextEditingController();
  TextEditingController ae = TextEditingController();
  TextEditingController af = TextEditingController();
  TextEditingController ag = TextEditingController();
  TextEditingController ah = TextEditingController();
  TextEditingController date = TextEditingController();
  // ..text = DateFormat('dd-MM-yyyy').format(DateTime.now());
  // ..text = widget.dateText;

  bool appActionsLoaded = true;
  File? image;
  // ignore: unused_field
  String? _imagePath;
  late Future<Log> futuree;
  late Future<List<Log2>> appActionsFuture;
  @override
  void initState() {
    print(widget.furefno);
    print(widget.num);
    date.text = widget.dateText;
    futuree =
        getWorkFollowDetailXmlV2(widget.furefno.toUpperCase(), widget.num);
    appActionsFuture = Get_Mobile_App_ActionsV2(widget.furefno);
    super.initState();
  }

  SingleChildScrollView futureBody(context, Log data, furefno) {
    var boxSize = MediaQuery.of(context).size.width;
    var boxPadding = EdgeInsets.only(left: 24);
    var textPadding = EdgeInsets.fromLTRB(24.0, 10, 0.0, 0.0);

    a.text = data.SartliUN;
    b.text = data.Musteri;
    c.text = data.Malik;
    d.text = data.Il;
    e.text = data.Ilce;
    f.text = data.Mahalle;
    g.text = data.Ada;
    h.text = data.Parsel;
    i.text = data.ArsaPayi;
    j.text = data.KatNo;
    k.text = data.BlokNo;
    l.text = data.BagBol;
    m.text = data.BagBolNit;
    n.text = data.NitelikAcik;
    p.text = data.HSBCEnAzSatisTutari;
    r.text = data.IpotekBedeli;
    s.text = data.IpotekPB;
    t.text = data.Kredif;
    u.text = data.IpotekD;
    v.text = data.RandTarihi;
    y.text = data.CepTel;
    z.text = data.EnErkenIpotek;
    aa.text = data.Sorumlu;
    ab.text = data.Sorumlu0;
    ac.text = data.Soruml1;
    ad.text = data.Cek;
    ae.text = data.RandSahibi;
    af.text = data.BankaAciklamasi;
    ag.text = data.SaticiAdi;
    ah.text = data.KredifDegisken;
    Widget textBlocks(textSecond, textFirst) {
      if (textFirst == "Tapu Randevu Tarihi") {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(24.0, 16, 0.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textFirst,
                    style: TextStyle(color: primaryGray),
                  ),
                  GestureDetector(
                    onTap: (textFirst == "Tapu Randevu Tarihi"
                        ? () async {
                            DateTime? pickedDate = await showDatePicker(
                                locale: const Locale("tr", "TR"),
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2101),
                                builder: (context, child) {
                                  return Theme(
                                      child: child!,
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: primaryBrand, // <-- SEE HERE
                                          onPrimary:
                                              Colors.white, // <-- SEE HERE
                                          onSurface:
                                              Colors.black, // <-- SEE HERE
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            primary:
                                                primaryBrand, // button text color
                                          ),
                                        ),
                                      ));
                                });
                            if (pickedDate != null) {
                              await _selectTime(context);
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy').format(pickedDate);
                              textSecond =
                                  "${formattedDate}T${selectedTime.hour.toString().length == 2 ? selectedTime.hour : "0${selectedTime.hour}"}:${selectedTime.minute}:00+3:00";

                              var response = await showAlertDialogTrue(
                                widget.furefno,
                                "${selectedTime.hour.toString().length == 1 ? "0${selectedTime.hour}" : selectedTime.hour}:${selectedTime.minute.toString().length == 1 ? "0${selectedTime.minute}" : selectedTime.minute}",
                                formattedDate.substring(6, 10),
                                formattedDate.substring(3, 5),
                                formattedDate.substring(0, 2),
                              );

                              print(response);

                              setState(() {
                                date.text =
                                    "${formattedDate}T${selectedTime.hour.toString().length == 2 ? selectedTime.hour : "0${selectedTime.hour}"}:${selectedTime.minute}:00+3:00";

                                print(formattedDate);
                              });
                            }
                          }
                        : () {}),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 24.0),
                      child: Visibility(
                        visible:
                            textFirst == "Tapu Randevu Tarihi" ? true : false,
                        child: Icon(
                          Icons.date_range_outlined,
                          color: primaryBrand,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
              child: TextField(
                style: TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
                controller: textSecond,
                maxLines: null,
                minLines: 1,
                decoration: InputDecoration(
                  enabled: false,
                  border: InputBorder.none,
                  filled: true,
                  fillColor: headColor,
                  hintStyle: TextStyle(fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey)),
                ),
              ),
            ),
          ],
        );
      } else {
        if (textSecond.text == "..." || textSecond.text == "") {
          return Container();
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(24.0, 16, 0.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textFirst,
                      style: TextStyle(color: primaryGray),
                    ),
                    GestureDetector(
                      onTap: (textFirst == "Tapu Randevu Tarihi"
                          ? () async {
                              DateTime? pickedDate = await showDatePicker(
                                  locale: const Locale("tr", "TR"),
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2022),
                                  lastDate: DateTime(2101),
                                  builder: (context, child) {
                                    return Theme(
                                        child: child!,
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary:
                                                primaryBrand, // <-- SEE HERE
                                            onPrimary:
                                                Colors.white, // <-- SEE HERE
                                            onSurface:
                                                Colors.black, // <-- SEE HERE
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                              primary:
                                                  primaryBrand, // button text color
                                            ),
                                          ),
                                        ));
                                  });
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('dd-MM-yyyy').format(pickedDate);

                                setState(() {
                                  date.text = formattedDate;
                                  textSecond = formattedDate;
                                  print(formattedDate);
                                });
                              }
                            }
                          : () {}),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24.0),
                        child: Visibility(
                          visible:
                              textFirst == "Tapu Randevu Tarihi" ? true : false,
                          child: Icon(
                            Icons.date_range_outlined,
                            color: primaryBrand,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: TextField(
                  style: TextStyle(color: Color.fromARGB(255, 90, 90, 90)),
                  controller: textSecond,
                  maxLines: null,
                  minLines: 1,
                  decoration: InputDecoration(
                    enabled: false,
                    border: InputBorder.none,
                    filled: true,
                    fillColor: headColor,
                    hintStyle: TextStyle(fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey)),
                  ),
                ),
              ),
            ],
          );
        }
      }
    }

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: bgColor),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 16.0, 0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 48,
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
                ),
                textBlocks(a, "Şartlu U.N"),
                textBlocks(b, "Müşteri"),
                textBlocks(c, "Malik"),
                textBlocks(d, "İl"),
                textBlocks(e, "İlçe"),
                textBlocks(f, "Mahalle"),
                textBlocks(g, "Ada"),
                textBlocks(h, "Parsel"),
                textBlocks(date, "Tapu Randevu Tarihi"),
                textBlocks(i, "Cep Tel No"),
                textBlocks(j, "Arsa Payı"),
                textBlocks(k, "Kat No"),
                textBlocks(l, "Blok No"),
                textBlocks(m, "Bağımsız Bölüm No"),
                textBlocks(n, "Niteliğin Açıklama"),
                textBlocks(p, "En AZ Satış Bedeli"),
                textBlocks(r, "İpotek Bedeli"),
                textBlocks(s, "İpotek Para Birimi"),
                textBlocks(t, "Kredi Faiz Oranı"),
                textBlocks(u, "İpoteğin Derecesi"),
                textBlocks(y, "Cep Tel. No"),
                textBlocks(z, "En Erken Ipotek Tesis Tarihi "),
                GestureDetector(
                    onTap: aa.text.isNotEmpty
                        ? () {
                            var phoneNum = aa.text;
                            var index = phoneNum.indexOf('-');
                            phoneNum =
                                phoneNum.substring(index, phoneNum.length);
                            phoneNum[0] != "0"
                                ? launch("tel:0$phoneNum")
                                : launch("tel:$phoneNum");
                            ;
                          }
                        : () {},
                    child: textBlocks(aa, "Sorumlu Avukat")),
                textBlocks(ab, "Sorumlu Avukat Bilgi"),
                textBlocks(ac, "Sorumlu Avukat Bilgisi"),
                textBlocks(ad, "Bloke Çek İşlemi"),
                textBlocks(ae, "Randevu Sahibi"),
                textBlocks(af, "Banka Açıklaması"),
                textBlocks(ag, "Satıcı Adı"),
                textBlocks(ah, "Kredi Faiz Oranı Değişken Mi"),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 40, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    color: headColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 52,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: primaryBrand,
                                ),
                                onPressed: () {
                                  if (appActionsLoaded == true)
                                    showAlertDialog(context);
                                  else {}
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
  }

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
            padding: const EdgeInsets.only(left: 30.0),
            child: Text("İşlem Detay", style: TextStyle(color: primaryBrand)),
          ),
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
          future: futuree,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                var data = snapshot.data!;
                return futureBody(context, data, widget.furefno);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
