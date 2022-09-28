//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/LoginByImeiNew.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<List<Log>> getDocumentDate(imei) async {
  var api =
      'http://$baseUrl:3000/getDocumentDateWorkFollow/api/fu_mobile/GetEvrakTeslimTarihiListIstakibi/$imei';
  var result = await Dio().get(api);

  if ((Data.fromJson(result.data).log).isNotEmpty) {
    return Data.fromJson(result.data).log;
  } else {
    List<Log> log = [];
    log.add(Data.fromJson(result.data).log2);
    return log;
  }
}
