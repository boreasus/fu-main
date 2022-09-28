//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/GetLawyerTransactionsAppointmentBImeiNo.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<List<Log>> getLawyerTransactionsAppointmentBImeiNoService() async {
  //var api = 'https://reqres.in/api/users?page=2';

  var api =
      'http://$baseUrl:3000/getLawyerTransactionsAppointmentBImeiNo/api/fu_mobile/Get_LawyerTransactionsWithoutAppointment_ByImeiNo/A8B4084027';
  var result = await Dio().get(api);

  print(result.data);

  try {
    List<Log> log = [Data.fromJson(result.data).isTakibi.logSingle];
    return log;
  } catch (e) {
    return Data.fromJson(result.data).isTakibi.log;
  }
}
