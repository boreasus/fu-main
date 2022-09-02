//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/LoginByImeiNew.dart';

Future<List<Log>> LoginByImeiNew(imei) async {
  var api = 'http://10.0.2.2:3000/loginByImei/api/fu_mobile/Login_ByImei/$imei';
  var result = await Dio().get(api);
  print("data geliyor mu => ${Data.fromJson(result.data).log[0].Ad}");
  return Data.fromJson(result.data).log;
}
