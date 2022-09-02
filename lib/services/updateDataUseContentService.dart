import 'package:dio/dio.dart';

void updateDataUseContentService(String imei) async {
  try {
    var api =
        'http://10.0.2.2:3000/updateDataUseConsent/api/fu_mobile/UpdateVeriKullanimIzni/$imei';
    var result = await Dio().get(api);
    print("UPDATE DATA USE CONTENT SERVICE");
  } catch (e) {
    print(e);
  }
}
