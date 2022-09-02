// ignore_for_file: file_names

//CREATEMOBILSESSION GİRİŞ YAP
//TEKRAR GÖNDER CHECK SMS FOR MOBİLE

import 'package:flutter/material.dart';
import 'package:fu_mobile/services/CheckSmsMobileService.dart';
import 'package:fu_mobile/screens/homepage.dart';
import 'package:fu_mobile/services/getImei.dart';
import 'package:fu_mobile/utilities/constant.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fu_mobile/services/createMobileSessionService.dart';

class LoginValidation extends StatefulWidget {
  const LoginValidation({Key? key}) : super(key: key);

  @override
  State<LoginValidation> createState() => _LoginValidationState();
}

class _LoginValidationState extends State<LoginValidation> {
  final sms = TextEditingController();
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  late Timer _timer;
  int _start = 10;
  late String imei;
  bool isOver60Sec = false;
  late String session;
  @override
  void initState() {
    super.initState();
    getImeipref().then((value) {
      this.imei = value;
      print("imei: $imei");
    });
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    // ignore: unnecessary_new
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            isOver60Sec = true;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: headColor,
          //LEADİNG
          leadingWidth: 110,
          leading: Center(
            child: TextButton(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      right: 2,
                      left: 5,
                    ),
                    child: Image.asset(
                      'assets/images/leading_icon.png',
                      width: 35,
                      height: 30,
                    ),
                  ),
                  const Text(
                    'İpuçları',
                    style: TextStyle(
                      color: primaryGray,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              onPressed: () {
                // ignore: avoid_print
                print('Button1');
              },
            ),
          ),

          //TİTLE
          title: Image.asset(
            'assets/images/fu_logo.png',
            height: 92,
            width: 92,
          ),

          //ACTİONS
          actions: <Widget>[
            Center(
              child: TextButton(
                child: Row(
                  children: [
                    const Text(
                      'Kılavuz',
                      style: TextStyle(
                        color: primaryGray,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        // fontWeight: FontWeight.bold
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          right: 5,
                          left: 5,
                        ),
                        child: Image.asset(
                          'assets/images/action_icon.png',
                          width: 35,
                          height: 30,
                        ))
                  ],
                ),
                onPressed: () {
                  // ignore: avoid_print
                  print('Button2');
                },
              ),
            ),
          ]),

      //BODY
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          height: 650,
          padding: EdgeInsets.all(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment(0.0, -0.9),
                child: buildScreenText(),
              ),
              Align(
                alignment: Alignment(0.0, -0.6),
                child: buildScreenDesc(),
              ),
              Align(
                alignment: Alignment(0.0, -0.1),
                child: buildScreenMessage(),
              ),
              Align(
                alignment: Alignment(0.0, 0.15),
                child: buildScreenButton(),
              ),
              Align(
                alignment: Alignment(0.0, 0.32),
                child: buildScreenReMessage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildScreenText() => Container(
        // mainAxisSize: MainAxisSize.min,
        width: 110,
        padding: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: primaryGray,
              width: 2,
            ),
          ),
        ),
        child: Text(
          '$_start',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: primaryBrand,
          ),
          textAlign: TextAlign.center,
        ),
      );

  Widget buildScreenDesc() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Lütfen cep telefon numaranıza gönderilen şifreyi giriniz.',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  Widget buildScreenMessage() => SizedBox(
        width: 300,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: primaryGray),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: TextField(
                controller: sms,
                cursorColor: primaryBrand,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Şifrenizi buraya giriniz.',
                )),
          ),
        ),
      );

  Widget buildScreenButton() => SizedBox(
        width: 300,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: primaryBrand,
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () async {
            try {
              session = await createMobileSession("A8B4084027", sms.text);
              setSession(session);
              session = await getSession();
              print(session);
              // ignore: use_build_context_synchronously
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (constext) => homePage(),
                ),
              );
            } catch (e) {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('HATALI SMS'),
                        content: Text('Lütfen kodunuzu tekrardan isteyin.'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Tamam')),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (constext) => homePage(),
                                  ),
                                );
                              },
                              child: Text('DEVELOPER NEXT'))
                        ],
                      ));
            }
          },
          child: Text(
            'Giriş Yap',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );

  Widget buildScreenReMessage() => SizedBox(
        width: 300,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: isOver60Sec == true
                ? BorderSide(color: primaryBrand)
                : BorderSide(color: bgColor),
            primary: bgColor,
            minimumSize: const Size.fromHeight(50),
            elevation: isOver60Sec == false ? 0 : 2,
          ),
          onPressed: isOver60Sec != false
              ? () async {
                  this.imei = await getImeipref();
                  var result = await checkSmsMobileService("aa");
                  if (result[0] == "<Result>NOK<Result>") {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('SMS HATASI'),
                              content: Text(
                                  'Lütfen ekranda gördüğünüz 10 haneli kodu Fu Gayrimenkul Yatırım Danışmanlık A.Ş.’yi arayarak kaydettiriniz'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Tamam')),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (constext) => homePage(),
                                        ),
                                      );
                                    },
                                    child: Text('DEVELOPER NEXT'))
                              ],
                            ));
                  } else if (result[0] == "<Result>nok_trylimit<Result>") {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('SMS HATASI'),
                              content: Text('Deneme Sınırını Aştınız'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Tamam')),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (constext) => homePage(),
                                        ),
                                      );
                                    },
                                    child: Text('DEVELOPER NEXT'))
                              ],
                            ));
                  } else if (result[0] == "<Result>NOK_Z<Result>") {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('SMS HATASI'),
                              content: Text('60 saniye içinde sms aldınız.'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Tamam')),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (constext) => homePage(),
                                        ),
                                      );
                                    },
                                    child: Text('DEVELOPER NEXT'))
                              ],
                            ));
                  } else if (result[0] == "<Result>OK<Result>") {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('SMS YOLLANDI'),
                              content: Text('SMS\'iniz tekrardan yollandı'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('Tamam')),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (constext) => homePage(),
                                        ),
                                      );
                                    },
                                    child: Text('DEVELOPER NEXT'))
                              ],
                            ));
                  }
                }
              : () {
                  setState(() {
                    if (_start == 0) {
                      _start = 60;
                      isOver60Sec = false;
                      startTimer();
                    }
                  });
                  null;
                },
          child: Text(
            "SMS'i tekrar gönder",
            style: TextStyle(
                fontSize: 20, color: _start == 0 ? primaryBrand : Colors.grey),
          ),
        ),
      );
}
