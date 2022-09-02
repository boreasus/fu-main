// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../utilities/constant.dart';

// ignore: camel_case_types
class cancelAppointment extends StatefulWidget {
  const cancelAppointment({Key? key}) : super(key: key);

  @override
  State<cancelAppointment> createState() => _cancelAppointmentState();
}

// ignore: camel_case_types
class _cancelAppointmentState extends State<cancelAppointment> {
  // Initial Selected Value
  String dropdownvalue = 'Beyan-Vekalet Onayı bekleniyor';

  // List of items in our dropdown menu
  var items = [
    'Beyan-Vekalet Onayı bekleniyor',
    'Banka Tarafından İptal',
    'İşlem Yetişmedi',
    'Taraflar Gelmedi / Taraflar\ntarafından iptal edildi.',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 110,
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
        title: Text("Randevu İptal", style: TextStyle(color: primaryBrand)),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                child: Container(
                  width: 330,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: primaryGray),
                      color: headColor),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    child: DropdownButton(
                      // Initial Value
                      value: dropdownvalue,
                      // Down Arrow Icon
                      icon: Padding(
                        padding: EdgeInsets.fromLTRB(70.0, 0.0, 0.0, 0.0),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: primaryBrand,
                        ),
                      ),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                child: Container(
                  width: 330,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: headColor,
                      border: Border.all(color: primaryGray)),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 0.0, 0.0),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Açıklama Giriniz",
                          hintStyle: TextStyle(fontSize: 16),
                          border: InputBorder.none),
                      maxLines: 10,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                child: SizedBox(
                  width: 330,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {},
                      child: Text(
                        "İptal Et",
                        style: TextStyle(fontSize: 20),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
