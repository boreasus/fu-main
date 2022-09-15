import 'package:flutter/material.dart';
import 'package:fu_mobile/screens/login.dart';
import 'package:fu_mobile/utilities/constant.dart';
import 'package:fu_mobile/services/updatePinServices.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  showAlertDialogMiss(BuildContext context) {
    // Create button
    Widget okButton = TextButton(
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
          "Lütfen TCKN ve Parola alanlarını eksiksiz doldurun.",
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

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  final tckn = TextEditingController();
  final password = TextEditingController();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        height: MediaQuery.of(context).size.height * 0.9,
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
              alignment: Alignment(0.0, -0.08),
              child: buildScreenPass(),
            ),
            Align(
              alignment: Alignment(0.0, 0.15),
              child: buildScreenButton(),
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
          'Kayıt',
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
            child: RichText(
              text: TextSpan(
                text: 'TC Kimlik numaranız ve ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black,
                ),
                children: const <TextSpan>[
                  TextSpan(
                    text: 'kendi belirleyeceğiniz bir parolayı ',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: 'girerek kaydınızı tamamlayınız.',
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
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
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
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
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
            print("tckn " + tckn.text);
            print("pass " + password.text);
            if (tckn.text.isEmpty || password.text.isEmpty) {
              showAlertDialogMiss(context);
            } else {
              var result = await UpdatePinClient(password.text, tckn.text);
              print(result);
              if (result == "NOK_NOPIN") {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('Kayıt Başarısız'),
                          content:
                              Text('Kullanıcı sistemde var ama kayıtlı değil.'),
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
                                      builder: (constext) => Login(),
                                    ),
                                  );
                                },
                                child: Text('DEVELOPER NEXT'))
                          ],
                        ));
              } else if (result == "NOK") {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text('Kayıt Başarısız'),
                          content: Text('Kullanıcı sisteme kayıtlı değil'),
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
                                      builder: (constext) => Login(),
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
            }

            // ignore: avoid_print
            // print('Button3');
          },
          child: Text(
            'Kayıt Ol',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
}
