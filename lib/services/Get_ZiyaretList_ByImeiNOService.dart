//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/Get_ZiyaretList_ByImeiNO.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<List<Log>> getZiyaretList(imei) async {
  var api =
      'http://$baseUrl:3000/getVisitedListByImeiNo/api/fu_mobile/Get_ZiyaretList_ByImeiNO/$imei';
  var result = await Dio().get(api);
  print(result.data);

  if (Data.fromJson(result.data).log.isNotEmpty) {
    print("liste çalıştı2");
    return Data.fromJson(result.data).log;
  } else {
    print("nesne çalıştı");
    Log log = Data.fromJson(result.data).log2;
    List<Log> log2 = [];
    log2.add(log);
    return log2;
  }
}
