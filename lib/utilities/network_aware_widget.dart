import 'package:flutter/material.dart';
import 'package:fu_mobile/utilities/constant.dart';
import 'network_status_service.dart.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

var counter = 0;

class NetworkAwareWidget extends StatelessWidget {
  final Widget onlineChild;
  final Widget offlineChild;

  const NetworkAwareWidget(
      {Key? key, required this.onlineChild, required this.offlineChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NetworkStatus networkStatus = Provider.of<NetworkStatus>(context);
    if (networkStatus == NetworkStatus.Online) {
      return onlineChild;
    } else {
      counter != 0
          ? _showToastMessage("Internet bağlantınız bulunmamaktadır.")
          : counter += 1;
      return offlineChild;
    }
  }

  void _showToastMessage(String message) {
    Fluttertoast.showToast(
        textColor: Colors.white,
        backgroundColor: primaryBrand,
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1);
  }
}
