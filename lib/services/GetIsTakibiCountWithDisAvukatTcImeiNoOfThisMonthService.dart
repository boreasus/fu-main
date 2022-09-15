//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/GetIsTakibiCountWithDisAvukatTcImeiNoOfThisMonth.dart';

Future<List<Log>> GetIsTakibiCountWithDisAvukatTcImeiNoOfThisMonth(imei) async {
  var api =
      'http://10.0.2.2:3000/getWorkFollowCountWithLaw/api/fu_mobile/GetIsTakibiCountWithDisAvukatTcImeiNoOfThisMonth/$imei';
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
