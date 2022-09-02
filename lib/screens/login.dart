import 'package:flutter/material.dart';
import 'package:fu_mobile/screens/loginValidation.dart';
import 'package:fu_mobile/services/getImei.dart';
import 'package:fu_mobile/utilities/constant.dart';
import 'package:fu_mobile/services/checkPin.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final tckn = TextEditingController();
  final password = TextEditingController();
  late String imei;
  @override
  void initState() {
    getImeipref().then((value) {
      this.imei = value;
      print(this.imei);
    });
    super.initState();
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
                  Text(
                    "İpuçları",
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
                alignment: Alignment(0.0, -0.3),
                child: buildScreenId(),
              ),
              Align(
                alignment: Alignment(0.0, -0.10),
                child: buildScreenPass(),
              ),
              Align(
                alignment: Alignment(0.0, 0.15),
                child: buildScreenButton(),
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
          )),
        ),
        child: Text(
          'Giriş',
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black,
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
              'TC Kimlik numaranız ve sizin belirlediğiniz parola ile giriş yapabilirsiniz.',
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
                controller: tckn,
                cursorColor: primaryBrand,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'TCKN Giriniz',
                )),
          ),
        ),
      );

  Widget buildScreenPass() => SizedBox(
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
                controller: password,
                cursorColor: primaryBrand,
                textAlign: TextAlign.center,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Parola Giriniz',
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
            print("tckn = " + tckn.text);
            print("pass =" + password.text);
            var result = await checkPinClient(tckn.text, password.text);
            print(result);

            if (result == 'OK') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (constext) => LoginValidation(),
                ),
              );
            } else if (result == "NOK") {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text('Giriş Başarısız'),
                        content: Text('Üye kaydınız bulunamadı.'),
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
                                    builder: (constext) => LoginValidation(),
                                  ),
                                );
                              },
                              child: Text('DEVELOPER NEXT'))
                        ],
                      ));
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (constext) => Login(),
                ),
              );
            }

            // ignore: avoid_print
            // print('Button3');
          },
          child: Text(
            'Giriş Yap',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
}
