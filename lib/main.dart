import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fu_mobile/dioExample.dart';
import 'package:fu_mobile/screens/homepage.dart';
import 'package:fu_mobile/screens/pdpa.dart';
import 'package:fu_mobile/screens/signup.dart';
import 'package:fu_mobile/services/getImei.dart';
import 'package:fu_mobile/transactions/mortgage.dart';
import 'package:fu_mobile/transactions/transactionDetail.dart';
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
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('en'), const Locale('tr')],
      debugShowCheckedModeBanner: false,
      title: 'Fu Mobile',
      home: homePage(),
    );
  }
}



//21283422914