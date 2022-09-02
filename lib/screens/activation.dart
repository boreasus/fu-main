import 'package:flutter/material.dart';

import 'package:fu_mobile/screens/signup.dart';
import 'package:fu_mobile/utilities/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fu_mobile/services/getImei.dart';

class Activation extends StatefulWidget {
  const Activation({Key? key}) : super(key: key);

  @override
  State<Activation> createState() => _ActivationState();
}

class _ActivationState extends State<Activation> {
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
      body: Container(
        padding: EdgeInsets.all(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment(0.0, -0.9),
              child: buildScreenText(),
            ),
            Align(
              alignment: Alignment(-0.5, -0.6),
              child: //buildScreenIMEI(),
                  FutureBuilder(
                      future: getImei(),
                      builder: ((context, snapshot) => buildScreenIMEI(
                          snapshot.data.toString().substring(0, 5)))),
            ),
            Align(
              alignment: Alignment(0.5, -0.6),
              child: FutureBuilder(
                  future: getImei(),
                  builder: ((context, snapshot) => buildScreenIMEI2(
                      snapshot.data.toString().substring(5, 10)))),
            ),
            Align(
              alignment: Alignment(0.0, -0.4),
              child: buildScreenDesc(),
            ),
            Align(
              alignment: Alignment(0.0, 0.0),
              child: buildScreenCall(),
            ),
            Align(
              alignment: Alignment(0.0, 0.2),
              child: buildScreenButton(),
            ),
            Align(
              alignment: Alignment(-0.64, 0.4),
              child: buildScreenHint(),
            ),
            Align(
              alignment: Alignment(0.65, 0.4),
              child: buildScreenGuide(),
            ),
          ],
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
          )),
        ),
        child: Text(
          'Aktivasyon',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      );

  Widget buildScreenIMEI(String str) => Container(
        // mainAxisSize: MainAxisSize.min,
        width: 110,
        padding: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
            color: primaryGray,
            width: 2,
          )),
        ),
        child: Text(
          str,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: primaryBrand,
          ),
          textAlign: TextAlign.center,
        ),
      );
  Widget buildScreenIMEI2(String str) => Container(
        // mainAxisSize: MainAxisSize.min,
        width: 110,
        padding: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
            color: primaryGray,
            width: 2,
          )),
        ),
        child: Text(
          str,
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
            child: RichText(
              text: TextSpan(
                text: 'Uygulamayı aktive etmek için yukarıdaki kodu ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: '0212 232 23 00 ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text:
                        'numaralı FU Gayrimenkul hattını arayarak kayıt ettirmelisiniz.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );

  Widget buildScreenId() => SizedBox(
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
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'TCKN Giriniz',
                )),
          ),
        ),
      );

  Widget buildScreenCall() => SizedBox(
        width: 300,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: primaryBrand,
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () {
            launch("tel:0212232300");
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (constext) => Signup(),
            //   ),
            // );
            // ignore: avoid_print
            // print('Ara Butonu');
          },
          child: Text(
            'Ara',
            style: TextStyle(fontSize: 20),
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Signup(),
              ),
            );
          },
          child: Text(
            'Kayıt Ettirildi',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
  Widget buildScreenHint() => SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: primaryGray,
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () {
            // ignore: avoid_print
            print('İpuçları Butonu');
          },
          child: Text(
            'İpuçları',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
  Widget buildScreenGuide() => SizedBox(
        width: MediaQuery.of(context).size.width / 3,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: primaryGray,
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () {
            // ignore: avoid_print
            print('Kılavuz Butonu');
          },
          child: Text(
            'Kılavuz',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
}

Future<void> _makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
