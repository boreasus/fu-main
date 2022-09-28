import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class MobilUygulamaAksiyonlari {
  final List<Aksiyon> aksiyon;
  MobilUygulamaAksiyonlari(this.aksiyon);



  factory MobilUygulamaAksiyonlari.fromJson(Map<String, dynamic> data){

    final aksiyonData = data['MobileUygulamaAksiyonlari'] as List<dynamic>?;
    final aksiyon = aksiyonData != null ? aksiyonData.map((aksiyonData) => Aksiyon.fromJson(aksiyonData)).toList():<Aksiyon>[];
    return MobilUygulamaAksiyonlari(aksiyon);
  }
  Map<String, dynamic> toJson() {
    return {
      'Aksiyon': aksiyon.map((aksiyon) => aksiyon.toJson()).toList()
    };
  }

}


class Aksiyon{
  String adi;
  String no;
  String banka_id;
  String file_name;
  String is_photo;
  Aksiyon(this.adi,this.no,this.banka_id,this.file_name,this.is_photo);

  factory Aksiyon.fromJson(Map<String, dynamic> data){
    final adi=data["Adi"] as String;
    final no =data["No"] as String;
    final banka_adi=data["BankaId"] as String;
    final file_name=data["FileName"] as String;
    final is_photo=data["IsPhoto"] as String;
    return Aksiyon(adi,no,banka_adi,file_name,is_photo);


  }//from json
  Map<String, dynamic> toJson() {
    return {
      'Adi': adi,
      'No':no,
      'BankaId':banka_id,
      'FileName':file_name,
      'IsPhoto':is_photo,
    };
  }

}




void getHttp() async {
  try {
    final response = await Dio().get('http://10.0.2.2:8080/');
    print("RESPONSE: "+ response.toString());
    print(response.data.runtimeType);

    Map<String, dynamic> value = jsonDecode(response.data);
    print(value.runtimeType);

    /*
    Map valueMap = jsonDecode(response.data);
    Map<dynamic, dynamic> result = valueMap;
    Map<String, dynamic> data = Map<String, dynamic>();
    for (dynamic type in result.keys) {
      data[type.toString()] = result[type];
    }*/





    final deneme = MobilUygulamaAksiyonlari.fromJson(value);
    print(deneme.aksiyon[0].adi);



  } catch (e) {
    print(e);
  }
}
void main() {
  getHttp();
}
class dioExample extends StatefulWidget {
  const dioExample({Key? key}) : super(key: key);

  @override
  State<dioExample> createState() => _dioExampleState();
}

class _dioExampleState extends State<dioExample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Dio örneği"),
      ),
      body: Container(
        child: Text("aaa"),
      ),
    );
  }
}
