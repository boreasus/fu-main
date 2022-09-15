// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fu_mobile/entity/Get_Mobile_App_ActionsV2.dart';
import 'package:fu_mobile/entity/InsertOrUpdate_Ziyaret_ByZiyaretIdService.dart';
import 'package:fu_mobile/services/GetMainBanksService.dart';
import 'package:fu_mobile/services/InsertOrUpdate_Ziyaret_ByZiyaretIdService.dart';
import 'package:fu_mobile/services/getBankBranchService.dart';

import 'package:intl/intl.dart';
import 'package:fu_mobile/entity/GetMainBanks.dart';
import 'package:fu_mobile/entity/getBankBranch.dart';

import '../utilities/constant.dart';

// ignore: camel_case_types
class resultNotification extends StatefulWidget {
  const resultNotification({Key? key}) : super(key: key);

  @override
  State<resultNotification> createState() => _resultNotificationState();
}

// ignore: camel_case_types
class _resultNotificationState extends State<resultNotification> {
  TextEditingController editingController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController ziyaretEdilenBankaController = TextEditingController();
  TextEditingController ziyaretSubeController = TextEditingController();
  TextEditingController ziyaretNedeniController = TextEditingController();
  TextEditingController ziyaretKonusucontroller = TextEditingController();
  TextEditingController adSoyadcontroller = TextEditingController();
  TextEditingController ePostacontroller = TextEditingController();
  TextEditingController cepNocontroller = TextEditingController();
  TextEditingController islemSayisicontroller = TextEditingController();
  TextEditingController firmaIsmicontroller = TextEditingController();
  TextEditingController genelDegerlendirmecontroller = TextEditingController();
  TextEditingController gorusController = TextEditingController();
  TextEditingController tercihSebebiController = TextEditingController();
  TextEditingController gelistirilmesiIstenenController =
      TextEditingController();
  String searchString = "";
  List<Log> ziyaretEdilenBanka = [];
  List<LogBank> ziyaretEdilenSube = [];
  List<String> ziyaretSebebi = ["Evrak Teslimi", "Şube Ziyareti"];
  List<String> tercihSebebi = [
    "Hatasız İşlem",
    "Zamanında İşlem Tamamlanması",
    "Hizmet Kalitesi",
    "Bilgi Güvenliği",
    "Yeterli Bilgi Birimi",
    "Yaygın Avukat Ağı",
    "İşlemle İlgilenen Personele Erişim Kolaylığı",
    "Diğer"
  ];
  var accountId = "";
  var anket1 = 5;
  var anket2 = 5;
  var anket3 = 5;
  var anket4 = 5;
  var anket5 = 5;
  var ipotek = 1;
  var tercihEtmeId = 0;
  @override
  void initState() {
    getMainBank().then((value) => ziyaretEdilenBanka = value);
    // TODO: implement initState
    super.initState();
  }

  showAlertDialogTrue(BuildContext context, text) {
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
          text,
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

  showAlertDialog(BuildContext context, List<Log> data) {
    Widget okButton(islem, index, id, len) => len != 0
        ? SizedBox(
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
                        ziyaretEdilenSube = [];
                        ziyaretSubeController.text = "";
                        ziyaretEdilenBankaController.text = islem;
                        getBankBranchService(id)
                            .then((value) => ziyaretEdilenSube = value);
                      });
                      Navigator.pop(
                        context,
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        : SizedBox(
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
                      "Banka Bulunamadı.\nInternet bağlantınızı kontrol edin\nya da\n sistem yöneticisiyle konuşun.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
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
            itemCount: data.length == 0 ? 1 : data.length,
            itemBuilder: ((context, index) => data.length != 0
                ? okButton(data[index].Name, index, data[index].Id, data.length)
                : okButton("", index, "", index)),
          ),
        ),
      ),
    );

    // Create AlertDialog
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog4(BuildContext context, List<String> data,
      TextEditingController controller) {
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
                      controller.text = islem;
                      tercihEtmeId = index + 1;
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
              itemBuilder: ((context, index) => okButton(data[index], index)),
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

  showAlertDialog3(BuildContext context) {
    Widget okButton(islem, index, id, len) => SizedBox(
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
                      ziyaretSubeController.text = islem;
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
            height: 50,
            child: Center(
              child: Text(
                'Lütfen önce Ziyaret Edilen Banka Seçiniz',
                textAlign: TextAlign.center,
              ),
            )),
      ),
    );

    // Create AlertDialog
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialog2(BuildContext context, List<LogBank> data) {
    Widget okButton(islem, index, id, len) => len != 0
        ? SizedBox(
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
                        ziyaretSubeController.text = islem;
                        editingController.text = "";
                        accountId = id;
                      });
                      Navigator.pop(
                        context,
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        : SizedBox(
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
                      "Merkez",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      ziyaretSubeController.text = "Merkez";
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
        content: StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: data.length == 0
                  ? (MediaQuery.of(context).size.height / 6)
                  : (MediaQuery.of(context).size.height / 6) * data.length,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryBrand),
                          borderRadius: BorderRadius.all(Radius.circular(9))),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Icon(
                              Icons.search,
                              color: primaryBrand,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: 30,
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 13.0, 0.0, 0.0),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    searchString = value.toLowerCase();
                                  });
                                },
                                controller: editingController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Arama"),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length == 0 ? 1 : data.length,
                        itemBuilder: ((context, index) {
                          if (data.length != 0) {
                            return data[index]
                                    .Name
                                    .toLowerCase()
                                    .contains(searchString)
                                ? okButton(data[index].Name, index,
                                    data[index].AccountId, data.length)
                                : Container();
                          } else {
                            return okButton("", index, "", data.length);
                          }
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));

    // Create AlertDialog
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDialogStar(BuildContext context) {
    AlertDialog alert = AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: StatefulBuilder(builder: ((context, setState) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Müşteri Memnuniyet Anketi',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: primaryBrand,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Text(
                          'İşlem FU\'ya yönlendirildikten sonra avukat ataması gerçekleşinceye kadar geçen süreç hakkındaki değerlendirmeniz:'),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 1,
                                    groupValue: anket1,
                                    onChanged: (val) {
                                      setState(() {
                                        anket1 = 1;
                                      });
                                    }),
                                Text("1"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 2,
                                    groupValue: anket1,
                                    onChanged: (val) {
                                      setState(() {
                                        anket1 = 2;
                                      });
                                    }),
                                Text("2"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 3,
                                    groupValue: anket1,
                                    onChanged: (val) {
                                      setState(() {
                                        anket1 = 3;
                                      });
                                    }),
                                Text("3"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 4,
                                    groupValue: anket1,
                                    onChanged: (val) {
                                      setState(() {
                                        anket1 = 4;
                                      });
                                    }),
                                Text("4"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 5,
                                    groupValue: anket1,
                                    onChanged: (val) {
                                      setState(() {
                                        anket1 = 5;
                                      });
                                    }),
                                Text("5"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          child: Container(color: Colors.grey),
                        ),
                      ),
                      Text(
                          'İpoteğin tesis aşamasında müşteri memnuniyeti hakkındaki değerlendirmeniz:'),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 1,
                                    groupValue: anket2,
                                    onChanged: (val) {
                                      setState(() {
                                        anket2 = 1;
                                      });
                                    }),
                                Text("1"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 2,
                                    groupValue: anket2,
                                    onChanged: (val) {
                                      setState(() {
                                        anket2 = 2;
                                      });
                                    }),
                                Text("2"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 3,
                                    groupValue: anket2,
                                    onChanged: (val) {
                                      setState(() {
                                        anket2 = 3;
                                      });
                                    }),
                                Text("3"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 4,
                                    groupValue: anket2,
                                    onChanged: (val) {
                                      setState(() {
                                        anket2 = 4;
                                      });
                                    }),
                                Text("4"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 5,
                                    groupValue: anket2,
                                    onChanged: (val) {
                                      setState(() {
                                        anket2 = 5;
                                      });
                                    }),
                                Text("5"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          child: Container(color: Colors.grey),
                        ),
                      ),
                      Text(
                          'İpotek tesisi tamamlandıktan sonra hukuk uygunluğu hakkındaki değerlendirmeniz:'),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 1,
                                    groupValue: anket3,
                                    onChanged: (val) {
                                      setState(() {
                                        anket3 = 1;
                                      });
                                    }),
                                Text("1"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 2,
                                    groupValue: anket3,
                                    onChanged: (val) {
                                      setState(() {
                                        anket3 = 2;
                                      });
                                    }),
                                Text("2"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 3,
                                    groupValue: anket3,
                                    onChanged: (val) {
                                      setState(() {
                                        anket3 = 3;
                                      });
                                    }),
                                Text("3"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 4,
                                    groupValue: anket3,
                                    onChanged: (val) {
                                      setState(() {
                                        anket3 = 4;
                                      });
                                    }),
                                Text("4"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 5,
                                    groupValue: anket3,
                                    onChanged: (val) {
                                      setState(() {
                                        anket3 = 5;
                                      });
                                    }),
                                Text("5"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          child: Container(color: Colors.grey),
                        ),
                      ),
                      Text(
                          'İpotek tesisi tamamlandıktan sonra evrak teslimi süreci hakkındaki değerlendirmeniz:'),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 1,
                                    groupValue: anket4,
                                    onChanged: (val) {
                                      setState(() {
                                        anket4 = 1;
                                      });
                                    }),
                                Text("1"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 2,
                                    groupValue: anket4,
                                    onChanged: (val) {
                                      setState(() {
                                        anket4 = 2;
                                      });
                                    }),
                                Text("2"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 3,
                                    groupValue: anket4,
                                    onChanged: (val) {
                                      setState(() {
                                        anket4 = 3;
                                      });
                                    }),
                                Text("3"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 4,
                                    groupValue: anket4,
                                    onChanged: (val) {
                                      setState(() {
                                        anket4 = 4;
                                      });
                                    }),
                                Text("4"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 5,
                                    groupValue: anket4,
                                    onChanged: (val) {
                                      setState(() {
                                        anket4 = 5;
                                      });
                                    }),
                                Text("5"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          child: Container(color: Colors.grey),
                        ),
                      ),
                      Text(
                          'İşlem esnasında ve sonrasında FU Genel Müdürlük ile kurulan yazılı sözlü iletişim hakkındaki değerlendirmeniz:'),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 1,
                                    groupValue: anket5,
                                    onChanged: (val) {
                                      setState(() {
                                        anket5 = 1;
                                      });
                                    }),
                                Text("1"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 2,
                                    groupValue: anket5,
                                    onChanged: (val) {
                                      setState(() {
                                        anket5 = 2;
                                      });
                                    }),
                                Text("2"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 3,
                                    groupValue: anket5,
                                    onChanged: (val) {
                                      setState(() {
                                        anket5 = 3;
                                      });
                                    }),
                                Text("3"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 4,
                                    groupValue: anket5,
                                    onChanged: (val) {
                                      setState(() {
                                        anket5 = 4;
                                      });
                                    }),
                                Text("4"),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Radio(
                                    value: 5,
                                    groupValue: anket5,
                                    onChanged: (val) {
                                      setState(() {
                                        anket5 = 5;
                                      });
                                    }),
                                Text("5"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: 1,
                          width: MediaQuery.of(context).size.width,
                          child: Container(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: primaryBrand,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text(
                          "TAMAM",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        )))),
              ],
            ),
          ),
        );
      })),
    );

    // Create AlertDialog
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: ((context, setStateForDialog) {
            return alert;
          }),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          toolbarHeight: 80,
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
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 50.0, 0.0),
            child: Center(
                child: Text("Ziyaret Sonucu Bildirimi",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: primaryBrand))),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: bgColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 25.0, 0, 5.0),
                      child: Text(
                        "Ziyaret Tarihi",
                        style: TextStyle(color: primaryGray, fontSize: 14),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: headColor,
                          border: Border.all(color: primaryGray)),
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: 50,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16.0, 0.0, 0, 0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.80,
                              height: 50,
                              child: TextField(
                                controller: dateinput,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.calendar_today,
                                      color: primaryBrand,
                                    ),
                                    hintText: "Ziyaret Tarihi",
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
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);

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
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 5.0),
                      child: Text(
                        "Ziyaret Sebebi",
                        style: TextStyle(color: primaryGray),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryGray),
                          borderRadius: BorderRadius.circular(5),
                          color: headColor),
                      child: GestureDetector(
                        onTap: () {
                          showAlertDialog4(
                              context, ziyaretSebebi, ziyaretNedeniController);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(10.0, 0, 0.0, 0.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.70,
                                height: 50,
                                child: TextField(
                                  controller: ziyaretNedeniController,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Sebep",
                                      hintStyle: TextStyle(color: primaryGray)),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: SizedBox(
                                    width: 40,
                                    height: 30,
                                    child: Icon(
                                      Icons.keyboard_arrow_right,
                                      color: primaryGray,
                                    )))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                      child: Text(
                        "Ziyaret Edilen Banka",
                        style: TextStyle(color: primaryGray),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryGray),
                          borderRadius: BorderRadius.circular(5),
                          color: headColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 0, 0.0, 0.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.70,
                              height: 50,
                              child: GestureDetector(
                                onTap: () {
                                  showAlertDialog(context, ziyaretEdilenBanka);
                                },
                                child: TextField(
                                  onChanged: (value) {},
                                  controller: ziyaretEdilenBankaController,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Banka",
                                      hintStyle: TextStyle(color: primaryGray)),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: SizedBox(
                                  width: 40,
                                  height: 30,
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: primaryGray,
                                  )))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 25.0, 0, 5.0),
                      child: Text(
                        "Ziyaret Edilen Şube",
                        style: TextStyle(color: primaryGray, fontSize: 14),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: headColor,
                          border: Border.all(color: primaryGray)),
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: 50,
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16.0, 0.0, 0, 0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.73,
                              height: 40,
                              child: GestureDetector(
                                onTap: () {
                                  if (ziyaretEdilenBankaController
                                      .text.isNotEmpty) {
                                    showAlertDialog2(
                                        context, ziyaretEdilenSube);
                                  } else {
                                    showAlertDialog3(context);
                                  }
                                },
                                child: TextField(
                                  controller: ziyaretSubeController,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(
                                        Icons.search,
                                        color: primaryBrand,
                                      ),
                                      hintText: "Şube",
                                      hintStyle: TextStyle(color: primaryGray)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 5.0),
                      child: Text(
                        "Ziyaret Konusu",
                        style: TextStyle(color: primaryGray),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryGray),
                          borderRadius: BorderRadius.circular(5),
                          color: headColor),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.73,
                          height: 30,
                          child: TextField(
                            controller: ziyaretKonusucontroller,
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Banka",
                                hintStyle: TextStyle(color: primaryGray)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 5.0),
                      child: Text(
                        "Ziyaret Edilen Kişinin Bilgileri",
                        style: TextStyle(color: primaryGray),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryGray),
                          borderRadius: BorderRadius.circular(5),
                          color: headColor),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.73,
                          height: 30,
                          child: TextField(
                            controller: adSoyadcontroller,
                            onEditingComplete: () =>
                                FocusScope.of(context).nextFocus(),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Ad Soyad",
                                hintStyle: TextStyle(color: primaryGray)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.88,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryGray),
                            borderRadius: BorderRadius.circular(5),
                            color: headColor),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.73,
                            height: 30,
                            child: TextField(
                              controller: ePostacontroller,
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "E-posta Adresi",
                                  hintStyle: TextStyle(color: primaryGray)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.88,
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryGray),
                            borderRadius: BorderRadius.circular(5),
                            color: headColor),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.73,
                            height: 30,
                            child: TextField(
                              controller: cepNocontroller,
                              onEditingComplete: () =>
                                  FocusScope.of(context).nextFocus(),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Cep Telefonu Numarası",
                                  hintStyle: TextStyle(color: primaryGray)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 5.0),
                      child: Text(
                        "Şubenin Aylık İşlem Sayısı",
                        style: TextStyle(color: primaryGray),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryGray),
                          borderRadius: BorderRadius.circular(5),
                          color: headColor),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.73,
                          height: 30,
                          child: TextField(
                            controller: islemSayisicontroller,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "İşlem Sayısı",
                                hintStyle: TextStyle(color: primaryGray)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 5.0),
                      child: Text(
                        "Çalışan Başka Banka İpotek Firması Varmı?",
                        style: TextStyle(color: primaryGray),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          child: Radio(
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => primaryBrand),
                              value: 1,
                              groupValue: ipotek,
                              onChanged: (value) {
                                setState(() {
                                  ipotek = 1;
                                });
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          child: Text(
                            "Evet",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 0.0),
                          child: Radio(
                              fillColor: MaterialStateColor.resolveWith(
                                  (states) => primaryBrand),
                              value: 0,
                              groupValue: ipotek,
                              onChanged: (value) {
                                setState(() {
                                  ipotek = 0;
                                });
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                          child: Text(
                            "Hayır",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.88,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryGray),
                          borderRadius: BorderRadius.circular(5),
                          color: headColor),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.73,
                          height: 30,
                          child: TextField(
                            controller: firmaIsmicontroller,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Varsa Firmanın İsmi",
                                hintStyle: TextStyle(color: primaryGray)),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (() {
                        showAlertDialog4(
                            context, tercihSebebi, tercihSebebiController);
                      }),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.88,
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryGray),
                              borderRadius: BorderRadius.circular(5),
                              color: headColor),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.70,
                                  height: 50,
                                  child: TextField(
                                    controller: tercihSebebiController,
                                    enabled: false,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Tercih Etme Sebebi",
                                        hintStyle:
                                            TextStyle(color: primaryGray)),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: SizedBox(
                                      width: 40,
                                      height: 30,
                                      child: Icon(
                                        Icons.keyboard_arrow_right,
                                        color: primaryGray,
                                      )))
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryGray),
                            color: primaryGray,
                            borderRadius: BorderRadius.circular(5)),
                        height: MediaQuery.of(context).size.width * 0.44,
                        width: MediaQuery.of(context).size.width * 0.88,
                        child: TextField(
                          controller: genelDegerlendirmecontroller,
                          maxLines: 10,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Genel Değerlendirme",
                            hintStyle: TextStyle(color: primaryGray),
                            fillColor: headColor,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.88,
                        height: 50,
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: primaryGray),
                            onPressed: () {
                              showAlertDialogStar(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                                  child: Flexible(
                                    child: Text(
                                      "Müşteri Memnuniyet Anketi",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                  child: Icon(Icons.keyboard_arrow_right),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: primaryGray),
                            color: primaryGray,
                            borderRadius: BorderRadius.circular(5)),
                        height: MediaQuery.of(context).size.width * 0.44,
                        width: MediaQuery.of(context).size.width * 0.88,
                        child: TextField(
                          controller: gelistirilmesiIstenenController,
                          maxLines: 10,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                                "En çok geliştirilmesini istediğiniz\nkonu(lar) ile ilgili görüşleriniz.",
                            hintStyle: TextStyle(color: primaryGray),
                            fillColor: headColor,
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 50),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.88,
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: primaryBrand),
                            onPressed: () async {
                              Log5 log = await InsertOrUpdateZiyaretByZiyaretId(
                                  "00000000-0000-0000-0000-000000000000",
                                  "A8B4084027",
                                  dateinput.text,
                                  accountId,
                                  Uri.encodeComponent(
                                      ziyaretKonusucontroller.text),
                                  Uri.encodeComponent(cepNocontroller.text),
                                  Uri.encodeComponent(adSoyadcontroller.text),
                                  Uri.encodeComponent(
                                      islemSayisicontroller.text),
                                  Uri.encodeComponent(ipotek.toString()),
                                  Uri.encodeComponent(firmaIsmicontroller.text),
                                  "5",
                                  Uri.encodeComponent(tercihEtmeId.toString()),
                                  Uri.encodeComponent(
                                      tercihSebebiController.text),
                                  Uri.encodeComponent(
                                      genelDegerlendirmecontroller.text),
                                  anket1,
                                  anket2,
                                  anket3,
                                  anket4,
                                  anket5,
                                  "5",
                                  Uri.encodeComponent(
                                      gelistirilmesiIstenenController.text),
                                  Uri.encodeComponent(ePostacontroller.text));

                              log.result == "OK"
                                  ? showAlertDialogTrue(
                                      context, "Ziyaret Sonucu Bildirildi")
                                  : showAlertDialogTrue(context, log.strResult);
                            },
                            child: Text(
                              "Gönder",
                              style: TextStyle(fontSize: 16),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
