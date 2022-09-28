//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/getWorkFollowByImeiNo.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<List<Log>> GetWorkFollowByImeiNoService(
    imei, firstDate, lastDate) async {
  var api =
      'http://$baseUrl:3000/getWorkFollowByImeiNo/api/fu_mobile/GetIsTakip_Get_By_ImeiNo/$imei/$firstDate/$lastDate/';
  var result = await Dio().get(api);
  print(result.data);

  if (Data.fromJson(result.data).log.isNotEmpty) {
    print("liste çalıştı");
    return Data.fromJson(result.data).log;
  } else {
    print("nesne çalıştı");
    Log log = Data.fromJson(result.data).log2;
    List<Log> log2 = [];
    log2.add(log);
    return log2;
  }
}
