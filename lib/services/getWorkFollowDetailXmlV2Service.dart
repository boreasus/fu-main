//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/GetWorkFollowDetailXmlV2.dart';

Future<Log> getWorkFollowDetailXmlV2(furefno, num) async {
  var api =
      'http://10.0.2.2:3000/getWorkFollowDetailXmlV2/api/fu_mobile/check/GetIstakipDetailXMLV2/$furefno/$num';
  var result = await Dio().get(api);
  print(result.data);
  return (Data.fromJson(result.data).isTakip.log);
}
