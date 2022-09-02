//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:fu_mobile/entity/CreateMobileSession.dart';
import 'package:dio/dio.dart';

Future<String> createMobileSession(String imei, String sms) async {
  //var api = 'https://reqres.in/api/users?page=2';

  var api =
      'http://10.0.2.2:3000/createMobileSession/api/fu_mobile/check/createMobileSession/$imei/$sms';
  var result = await Dio().get(api);

  return Log.fromJson(result.data).session;
}
