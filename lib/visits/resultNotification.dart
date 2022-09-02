// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utilities/constant.dart';

// ignore: camel_case_types
class resultNotification extends StatefulWidget {
  const resultNotification({Key? key}) : super(key: key);

  @override
  State<resultNotification> createState() => _resultNotificationState();
}

// ignore: camel_case_types
class _resultNotificationState extends State<resultNotification> {
  TextEditingController dateinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 25.0, 270, 5.0),
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
                    width: 360,
                    height: 50,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.0, 0.0, 0, 0),
                          child: SizedBox(
                            width: 300,
                            height: 40,
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
                    padding: EdgeInsets.fromLTRB(0.0, 25.0, 260.0, 5.0),
                    child: Text(
                      "Ziyaret Sebebi",
                      style: TextStyle(color: primaryGray),
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryGray),
                        borderRadius: BorderRadius.circular(5),
                        color: headColor),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                          child: SizedBox(
                            width: 300,
                            height: 30,
                            child: TextField(
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 25.0, 250.0, 5.0),
                    child: Text(
                      "Ziyaret Edilen Banka",
                      style: TextStyle(color: primaryGray),
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryGray),
                        borderRadius: BorderRadius.circular(5),
                        color: headColor),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                          child: SizedBox(
                            width: 300,
                            height: 30,
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Banka",
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 25.0, 240, 5.0),
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
                    width: 360,
                    height: 50,
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.0, 0.0, 0, 0),
                          child: SizedBox(
                            width: 300,
                            height: 40,
                            child: TextField(
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
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 25.0, 260.0, 5.0),
                    child: Text(
                      "Ziyaret Konusu",
                      style: TextStyle(color: primaryGray),
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryGray),
                        borderRadius: BorderRadius.circular(5),
                        color: headColor),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: SizedBox(
                        width: 300,
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Banka",
                              hintStyle: TextStyle(color: primaryGray)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 25.0, 175.0, 5.0),
                    child: Text(
                      "Ziyaret Edilen Kişinin Bilgileri",
                      style: TextStyle(color: primaryGray),
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryGray),
                        borderRadius: BorderRadius.circular(5),
                        color: headColor),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: SizedBox(
                        width: 300,
                        height: 30,
                        child: TextField(
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
                      width: 360,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryGray),
                          borderRadius: BorderRadius.circular(5),
                          color: headColor),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        child: SizedBox(
                          width: 300,
                          height: 30,
                          child: TextField(
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
                      width: 360,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryGray),
                          borderRadius: BorderRadius.circular(5),
                          color: headColor),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                        child: SizedBox(
                          width: 300,
                          height: 30,
                          child: TextField(
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
                    padding: EdgeInsets.fromLTRB(0.0, 25.0, 190.0, 5.0),
                    child: Text(
                      "Şubenin Aylık İŞlem Sayısı",
                      style: TextStyle(color: primaryGray),
                    ),
                  ),
                  Container(
                    width: 360,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryGray),
                        borderRadius: BorderRadius.circular(5),
                        color: headColor),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: SizedBox(
                        width: 300,
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "İşlem Sayısı",
                              hintStyle: TextStyle(color: primaryGray)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 25.0, 80.0, 5.0),
                    child: Text(
                      "Çalışan Başka Banka İpotek Firması Varmı?",
                      style: TextStyle(color: primaryGray),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                        child: Radio(
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => primaryBrand),
                            value: 2,
                            groupValue: 2,
                            onChanged: (value) {}),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
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
                            value: 2,
                            groupValue: 1,
                            onChanged: (value) {}),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          "Hayır",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 360,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(color: primaryGray),
                        borderRadius: BorderRadius.circular(5),
                        color: headColor),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: SizedBox(
                        width: 300,
                        height: 30,
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Varsa Firmanın İsmi",
                              hintStyle: TextStyle(color: primaryGray)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    child: Container(
                      width: 360,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryGray),
                          borderRadius: BorderRadius.circular(5),
                          color: headColor),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                            child: SizedBox(
                              width: 300,
                              height: 30,
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Tercih Etme Sebebi",
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
                    padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryGray),
                          color: primaryGray,
                          borderRadius: BorderRadius.circular(5)),
                      margin: EdgeInsets.all(12),
                      height: 180,
                      width: 350,
                      child: TextField(
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
                  SizedBox(
                    width: 345,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: primaryGray),
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 0.0),
                              child: Text(
                                "Müşteri Memnuniyet Anketi",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(50.0, 0.0, 0.0, 0.0),
                              child: Icon(Icons.keyboard_arrow_right),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: primaryGray),
                          color: primaryGray,
                          borderRadius: BorderRadius.circular(5)),
                      margin: EdgeInsets.all(12),
                      height: 180,
                      width: 350,
                      child: TextField(
                        maxLines: 10,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText:
                              "En çok gelitirilmesini istediğiniz\nkonu(lar) ile ilgili görüşleriniz.",
                          hintStyle: TextStyle(color: primaryGray),
                          fillColor: headColor,
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50),
                    child: SizedBox(
                      height: 50,
                      width: 348,
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: primaryBrand),
                          onPressed: () {},
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
        ));
  }
}
