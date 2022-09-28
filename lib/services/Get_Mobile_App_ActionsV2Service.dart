//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/Get_Mobile_App_ActionsV2.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<List<Log2>> Get_Mobile_App_ActionsV2(furefno) async {
  var api =
      'http://$baseUrl:3000/getMobileAppActionsV2/api/fu_mobile/Get_Mobile_App_ActionsV2/$furefno';
  var result = await Dio().get(api);
  print(">>>>>>>>>> ${result.data} <<<<<<<<<<<<<<\n\n\n\n\n");

  if (Data.fromJson(result.data)
      .mobileUygulamaAksiyonlari
      .aksiyon
      .log
      .isNotEmpty) {
    print("bura çalıştı222");
    return Data.fromJson(result.data).mobileUygulamaAksiyonlari.aksiyon.log;
  } else {
    print("xxxxxxxxxxxxx");
    List<Log2> log = [];
    log.add(Data.fromJson(result.data).mobileUygulamaAksiyonlari.aksiyon.log2);
    print(log);
    return log;
  }
}
