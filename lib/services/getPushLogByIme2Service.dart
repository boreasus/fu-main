//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:fu_mobile/entity/GetPushLogs_WithImei2.dart';
import 'package:dio/dio.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<List<Log>>? getPushLogByImei2(String imei) async {
  //var api = 'https://reqres.in/api/users?page=2';
  try {
    var api =
        'http://$baseUrl:3000/getPushLogsWithImei2/api/fu_mobile/GetPushLogs_WithImei2/$imei';
    var result = await Dio().get(api);
    print(
        "servis çalıştı ${ResultImeiStr.fromJson(result.data).resultIMEI2.pushLogs.log[0].Category}");
    var data = ResultImeiStr.fromJson(result.data).resultIMEI2.pushLogs.log;
    if (data.isNotEmpty) {
      return ResultImeiStr.fromJson(result.data).resultIMEI2.pushLogs.log;
    } else {
      List<Log> log = [];
      log.add(ResultImeiStr.fromJson(result.data).resultIMEI2.pushLogs.log2);
      return log;
    }
  } catch (e) {
    throw e;
  }
}
