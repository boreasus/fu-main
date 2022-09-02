//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:fu_mobile/entity/CheckSmsMobile.dart';
import 'package:dio/dio.dart';

Future<List<String>> checkSmsMobileService(String sms) async {
  //var api = 'https://reqres.in/api/users?page=2';

  var api =
      'http://10.0.2.2:3000/checkSmsMobile/api/fu_mobile/check/checkSmsMobile/$sms';
  var result = await Dio().get(api);
  print("1");
  print(checkSmsResponse.fromJson(result.data).CheckSMSForMobileResult);
  print("2");
  //print(checkSmsResponse.fromJson(result.data).mReturn);
  return [
    checkSmsResponse.fromJson(result.data).CheckSMSForMobileResult,
    //checkSmsResponse.fromJson(result.data).mReturn
  ];
}
