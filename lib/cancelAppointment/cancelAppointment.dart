import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fu_mobile/utilities/constant.dart';

class cancelAppointment extends StatefulWidget {
  const cancelAppointment({super.key});

  @override
  State<cancelAppointment> createState() => _cancelAppointmentState();
}

class _cancelAppointmentState extends State<cancelAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          icon: Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: headColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text("İşlem Detay", style: TextStyle(color: primaryBrand)),
        ),
      ),
    );
  }
}
