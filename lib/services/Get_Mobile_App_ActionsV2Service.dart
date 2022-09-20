//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/Get_Mobile_App_ActionsV2.dart';

Future<List<Log2>> Get_Mobile_App_ActionsV2(furefno) async {
  var api =
      'http://10.0.2.2:3000/getMobileAppActionsV2/api/fu_mobile/Get_Mobile_App_ActionsV2/$furefno';
  var result = await Dio().get(api);
  print(">>>>>>>>>> ${result.data}");
  try {
    if (Data.fromJson(result.data)
        .mobileUygulamaAksiyonlari
        .aksiyon
        .log
        .isNotEmpty) {
      return Data.fromJson(result.data).mobileUygulamaAksiyonlari.aksiyon.log;
    } else {
      List<Log2> log = [];
      log.add(
          Data.fromJson(result.data).mobileUygulamaAksiyonlari.aksiyon.log2);
      return log;
    }
  } catch (e) {
    List<Log2> log = [];

    return log;
  }
}
