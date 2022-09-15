//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/GetMainBanks.dart';

Future<List<Log>> getMainBank() async {
  var api = 'http://10.0.2.2:3000/getMainBanks/api/fu_mobile/Get_AnaBankalar';
  var result = await Dio().get(api);
  print(result.data);

  return Data.fromJson(result.data).log;
}
