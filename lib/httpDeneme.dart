import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;



Future fetchAksiyon() async {
  print("fetchaksiyon");
  final response = await http
      .get(Uri.parse('http://10.0.2.2:8080'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return response.body; //Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future loadProduct() async {
  print("loadproduct");
  String jsonAksiyon = '{"MobileUygulamaAksiyonlari":{"Aksiyon":[{"Adi":["Ä°potek EvraklarÄ±nÄ± GÃ¶ndereceÄŸim"],"No":["1"],"BankaId":["300240bc-14de-e111-9f61-00237ddbc591"],"IsPhoto":["True"],"FileName":["ipotek"]},{"Adi":["Tapu KÃ¼tÃ¼ÄŸÃ¼ GÃ¶ndereceÄŸim"],"No":["2"],"BankaId":["300240bc-14de-e111-9f61-00237ddbc591"],"IsPhoto":["True"],"FileName":["tapu"]},{"Adi":["Vekaletname GÃ¶ndereceÄŸim"],"No":["3"],"BankaId":["300240bc-14de-e111-9f61-00237ddbc591"],"IsPhoto":["True"],"FileName":["vekaletname"]},{"Adi":["Bloke Ã‡ek GÃ¶ndereceÄŸim"],"No":["4"],"BankaId":["300240bc-14de-e111-9f61-00237ddbc591"],"IsPhoto":["True"],"FileName":["bloke"]},{"Adi":["Taslak EvraklarÄ±nÄ± GÃ¶ndereceÄŸim"],"No":["21"],"BankaId":["300240bc-14de-e111-9f61-00237ddbc591"],"IsPhoto":["True"],"FileName":["taslak"]}]}}';  //await fetchAksiyon;
  final jsonResponse = json.decode(jsonAksiyon);
  print(jsonResponse);
  MobilUygulamaAksiyonlari mobilUygulamaAksiyonlari = new MobilUygulamaAksiyonlari.fromJson(jsonResponse);
  print("deneme "+ mobilUygulamaAksiyonlari.aksiyon[0].adi);
}

class MobilUygulamaAksiyonlari {
  final List<Aksiyon> aksiyon;
  MobilUygulamaAksiyonlari(this.aksiyon);
  factory MobilUygulamaAksiyonlari.fromJson(Map<String, dynamic> parsedJson){
    var list = (parsedJson['Aksiyon'] ?? [])  as List;
    List<Aksiyon> aksiyonList = list.map((i) => Aksiyon.fromJson(i)).toList();
    return MobilUygulamaAksiyonlari(aksiyonList);
  }

}



class Aksiyon{
  String adi;
  String no;
  String banka_id;
  String is_photo;
  String file_name;
  Aksiyon(this.adi,this.no,this.banka_id,this.file_name,this.is_photo);

  factory Aksiyon.fromJson(Map<String, dynamic> parsedJson){
    return Aksiyon(parsedJson['Adi'],parsedJson['No'],parsedJson['BankaId'],parsedJson['FileName'],parsedJson['IsPhoto']);


        /*adi:parsedJson['Adi'],
        no:parsedJson['No'],
        banka_adi:parsedJson['BankaId'],
        is_photo:parsedJson['IsPhoto'],
        file_name:parsedJson['FileName']*/

  }//from json
  }//aksiyon







void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {

  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<MobilUygulamaAksiyonlari> futureAksiyon;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loadProduct();
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: Column(
            children: [
            ],
          )
        ),
      ),
    );
  }
}