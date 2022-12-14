import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fu_mobile/dioExample.dart';
import 'package:fu_mobile/screens/homepage.dart';
import 'package:fu_mobile/screens/pdpa.dart';
import 'package:fu_mobile/screens/signup.dart';
import 'package:fu_mobile/services/getImei.dart';
import 'package:fu_mobile/transactions/mortgage.dart';
import 'package:fu_mobile/transactions/transactionDetail.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Fu Mobile',
      home: Mortgage(),
    );
  }
}



//21283422914