import 'dart:ffi';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getImei() async {
  String uniqueDeviceId = '';
  SharedPreferences prefs = await SharedPreferences.getInstance();

  var deviceInfo = DeviceInfoPlugin();

  if (Platform.isIOS) {
    // import 'dart:io'
    var iosDeviceInfo = await deviceInfo.iosInfo;
    uniqueDeviceId = '${iosDeviceInfo.identifierForVendor}';
    return uniqueDeviceId; // unique ID on iOS


    
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    uniqueDeviceId = '${androidDeviceInfo.id}'; // unique ID on Android
    var Imei = androidDeviceInfo.id!.replaceAll('.', '');
    Imei = Imei.substring(Imei.length - 10, Imei.length);
    await prefs.setString("imei", Imei);
    print('${Imei}');
    return Imei;
  }
  return "";
}

Future<String> getImeipref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String imei = prefs.getString("imei") ?? "";
  return imei;
}

void setSession(session) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("session", session);
}

Future<String> getSession() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String session = prefs.getString("session") ?? "";
  return session;
}
