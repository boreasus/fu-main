//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/Get_OFF_Days_From_SystemUser_With_Imei2.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<Log> getOffDaysFromUser(imei, boolean, startDate, endDate) async {
  var api =
      'http://$baseUrl:3000/getDaysFromSystemUserImei2/api/fu_mobile/Get_OFF_Days_From_SystemUser_With_Imei2/$imei/$boolean/$startDate/$endDate';
  var result = await Dio().get(api);
  print(result.data);

  return Data.fromJson(result.data).log;
}
