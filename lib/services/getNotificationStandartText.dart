//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
// ignore_for_file: non_constant_identifier_names

import 'package:fu_mobile/entity/GetNotificationStandartText.dart';
import 'package:dio/dio.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<List<LogText>>? Get_Notification_Text() async {
  //var api = 'https://reqres.in/api/users?page=2';

  var api =
      'http://$baseUrl:3000/getNotificationStandartText/api/fu_mobile/Get_Notification_StandartText';
  var result = await Dio().get(api);
  print(
      " =============>>>> \n ${DataText.fromJson(result.data).pushLogs.bildirimDepartmani.logText[0].Name} \n<<<<============");
  return DataText.fromJson(result.data).pushLogs.bildirimDepartmani.logText;
}
