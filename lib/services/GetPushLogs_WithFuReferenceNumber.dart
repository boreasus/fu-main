//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:fu_mobile/entity/getPushLogsWithFuReferenceNumber.dart';
import 'package:dio/dio.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<List<LogRef>> getPushLogByFuRefNo(String refNo) async {
  //var api = 'https://reqres.in/api/users?page=2';

  var api =
      'http://$baseUrl:3000/getPushLogsFuReferenceNumber/api/fu_mobile/GetPushLogs_WithFuReferenceNumber/$refNo';
  var result = await Dio().get(api);
  print("adawkdjakldjlakdjkawdjlawjdlakjdlawjdkawjld");
  print(PushLogs.fromJson(result.data).log.isNotEmpty);
  if (PushLogs.fromJson(result.data).log.isNotEmpty) {
    print("bura çalıştı2");
    return PushLogs.fromJson(result.data).log;
  } else {
    List<LogRef> log = [];
    log.add(PushLogs.fromJson(result.data).log2);
    return log;
  }
}
