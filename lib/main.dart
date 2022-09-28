import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fu_mobile/dioExample.dart';
import 'package:fu_mobile/screens/homepage.dart';
import 'package:fu_mobile/screens/pdpa.dart';
import 'package:fu_mobile/screens/signup.dart';
import 'package:fu_mobile/services/getImei.dart';
import 'package:fu_mobile/transactions/mortgage.dart';
import 'package:fu_mobile/transactions/transactionDetail.dart';
import 'package:fu_mobile/utilities/constant.dart';
import 'package:fu_mobile/visits/resultNotification.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('tr')
        ],
        debugShowCheckedModeBanner: false,
        title: 'Fu Mobile',
        // home: MyWidget(),
        home: FutureBuilder<String>(
          future: getSession(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                if (snapshot.data!.length > 0)
                  return homePage();
                else {
                  print("yok bura ");
                  return Pdpa();
                }
              } else {
                print("yok bura çalıştı");
                return Pdpa();
              }
            } else
              return MyWidget();
          }),
        ));
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBrand,
      body: SafeArea(
          child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 80,
          child: Image.asset(
            'assets/images/fu_logo.png',
            width: 150,
            height: 150,
          ),
        ),
      )),
    );
  }
}


//21283422914