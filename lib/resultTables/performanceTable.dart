// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fu_mobile/entity/GetPerformansTable.dart';
import 'package:fu_mobile/services/getPerformansTableService.dart';
import '../utilities/constant.dart';

// ignore: camel_case_types
class performanceTable extends StatefulWidget {
  const performanceTable({Key? key}) : super(key: key);

  @override
  State<performanceTable> createState() => _performanceTableState();
}

// Future get() async {
//   return await GetPerformanceTableClient("A8B4084027", 0);
// }

// ignore: camel_case_types
class _performanceTableState extends State<performanceTable> {
  @override
  void initState() {
    GetPerformanceTableClient("A8B4084027").then((value) {
      print(value[0].Agustos);
    });
    super.initState();
  }

  Widget tablebox(color, text) {
    return Container(
      // her bi kutu
      color: color == 0
          ? primaryBrand
          : color == 1
              ? Colors.white
              : Color.fromARGB(60, 137, 113, 1),
      height: MediaQuery.of(context).size.height * 0.65 / 13,
      width: ((MediaQuery.of(context).size.width - 48) / 4) - 0.7,
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: color == 0 ? Colors.white : Colors.black),
      )),
    );
  }

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
          title:
              Text("Performans Tablosu", style: TextStyle(color: primaryBrand)),
        ),
        body: FutureBuilder<List<Datas>>(
          future: GetPerformanceTableClient("A8B4084027"),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data ?? null;
              return snapshot.data != null
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.65,
                          child: Row(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                width: MediaQuery.of(context).size.width - 48,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: data!.length + 1,
                                    itemBuilder: ((context, index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(left: 1.0),
                                        child: Column(children: [
                                          tablebox(
                                              0,
                                              index == 0
                                                  ? "Ay"
                                                  : data[index - 1].Yil),
                                          tablebox(
                                              1,
                                              index == 0
                                                  ? "Ocak"
                                                  : data[index - 1].Ocak),
                                          tablebox(
                                              2,
                                              index == 0
                                                  ? "Şubat"
                                                  : data[index - 1].Subat),
                                          tablebox(
                                              1,
                                              index == 0
                                                  ? "Mart"
                                                  : data[index - 1].Mart),
                                          tablebox(
                                              2,
                                              index == 0
                                                  ? "Nisan"
                                                  : data[index - 1].Nisan),
                                          tablebox(
                                              1,
                                              index == 0
                                                  ? "Mayıs"
                                                  : data[index - 1].Mayis),
                                          tablebox(
                                              2,
                                              index == 0
                                                  ? "Haziran"
                                                  : data[index - 1].Haziran),
                                          tablebox(
                                              1,
                                              index == 0
                                                  ? "Temmuz"
                                                  : data[index - 1].Temmuz),
                                          tablebox(
                                              2,
                                              index == 0
                                                  ? "Ağustos"
                                                  : data[index - 1].Agustos),
                                          tablebox(
                                              1,
                                              index == 0
                                                  ? "Eylül"
                                                  : data[index - 1].Eylul),
                                          tablebox(
                                              2,
                                              index == 0
                                                  ? "Ekim"
                                                  : data[index - 1].Ekim),
                                          tablebox(
                                              1,
                                              index == 0
                                                  ? "Kasım"
                                                  : data[index - 1].Kasim),
                                          tablebox(
                                              2,
                                              index == 0
                                                  ? "Aralık"
                                                  : data[index - 1].Aralik),
                                        ]),
                                      );
                                    })),
                              )
                            ],
                          )))
                  : Center(
                      child: Text('Herhangi bir veriniz yok'),
                    );
            } else
              return Container(
                  child: Center(child: CircularProgressIndicator()));
          }),
        ));
  }
}
