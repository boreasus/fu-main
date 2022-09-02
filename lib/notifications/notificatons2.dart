// import 'package:flutter/material.dart';
// import 'package:fu_mobile/notifications/informationNotices.dart';
// import 'package:fu_mobile/services/getPushLogByIme2Service.dart';
// import 'package:fu_mobile/entity/GetPushLogs_WithImei2.dart';
// import '../utilities/constant.dart';

// // ignore: camel_case_types
// class notifications extends StatefulWidget {
//   const notifications({Key? key}) : super(key: key);
//   @override
//   State<notifications> createState() => _notificationsState();
// }

// // ignore: camel_case_types
// class _notificationsState extends State<notifications> {
//   List list = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 80,
//         leadingWidth: 110,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: headColor,
//         title: Text("Bildirim Kategorileri",
//             style: TextStyle(color: primaryBrand)),
//       ),
//       body: Container(
//         decoration: BoxDecoration(color: bgColor),
//         child: Column(
//           children: [
//             FutureBuilder<List<Log>>(
//               future: getPushLogByImei2("asd"),
//               builder: ((context, snapshot) {
//                 if (snapshot.hasData) {
//                   list = snapshot.data!.toSet().toList();
//                   ListView.builder(
//                     itemCount: list.length,
//                     itemBuilder: ((context, index) =>
//                         menus(context, list[index])),
//                   );
//                 }
//                 return CircularProgressIndicator();
//               }

//                   /*ListView.builder(itemBuilder: snapshot.data.toSet().toList()) : 
//               CircularProgressIndicator()
//               */
//                   ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// Widget menus(context, category) => Row(
//       children: [
//         Padding(
//           padding: EdgeInsets.fromLTRB(25.0, 20.0, 0.0, 20.0),
//           child: Text(
//             category,
//             style: TextStyle(fontSize: 16),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(140.0, 20, 0.0, 20.0),
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20), color: primaryBrand),
//             width: 24,
//             height: 24,
//             child: Padding(
//               padding: EdgeInsets.all(2.0),
//               child: Text(
//                 "5",
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
//           child: IconButton(
//               onPressed: (() {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => informationNoties()));
//               }),
//               icon: Icon(Icons.keyboard_arrow_right)),
//         )
//       ],
//     );
