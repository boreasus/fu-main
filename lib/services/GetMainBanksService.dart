//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/GetMainBanks.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<List<Log>> getMainBank() async {
  var api = 'http://$baseUrl:3000/getMainBanks/api/fu_mobile/Get_AnaBankalar';
  var result = await Dio().get(api);
  print(result.data);

  return Data.fromJson(result.data).log;
}
