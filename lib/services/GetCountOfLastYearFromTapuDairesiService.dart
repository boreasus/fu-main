//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/GetCountOfLastYearFromTapuDairesi.dart';

Future<List<Log>> getCountOfLastYearFromTapuDairesi(imei) async {
  var api =
      'http://10.0.2.2:3000/getCountLastYearDeed/api/fu_mobile/check/GetCountOfLastYearFromTapuDairesi/$imei';
  var result = await Dio().get(api);
  print(result.data);

  return Data.fromJson(result.data).log;
}
