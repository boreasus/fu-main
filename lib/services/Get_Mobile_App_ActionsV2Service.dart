//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/Get_Mobile_App_ActionsV2.dart';

Future<List<Log2>> Get_Mobile_App_ActionsV2(furefno) async {
  var api =
      'http://10.0.2.2:3000/getMobileAppActionsV2/api/fu_mobile/Get_Mobile_App_ActionsV2/$furefno';
  var result = await Dio().get(api);

  // print(result.data);
  return Data.fromJson(result.data).mobileUygulamaAksiyonlari.aksiyon.log;
}
