import 'package:dio/dio.dart';
import 'package:fu_mobile/utilities/constant.dart';

void updateDataUseContentService(String imei) async {
  try {
    var api =
        'http://$baseUrl:3000/updateDataUseConsent/api/fu_mobile/UpdateVeriKullanimIzni/$imei';
    var result = await Dio().get(api);
    print("UPDATE DATA USE CONTENT SERVICE");
  } catch (e) {
    print(e);
  }
}
