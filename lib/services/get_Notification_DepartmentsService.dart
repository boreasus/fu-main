//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:fu_mobile/entity/Get_Notification_Departments.dart';
import 'package:dio/dio.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<List<Log>>? Get_Notification_Departments() async {
  //var api = 'https://reqres.in/api/users?page=2';

  var api =
      'http://$baseUrl:3000/getNotificationDepartments/api/fu_mobile/Get_Notification_Departments/';
  var result = await Dio().get(api);
  print(" ============= \n ${result} \n============");
  print(Data.fromJson(result.data).pushLogs.bildirimDepartmani.log[0].ID);
  return Data.fromJson(result.data).pushLogs.bildirimDepartmani.log;
}
