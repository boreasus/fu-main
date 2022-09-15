//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/getLawyerAppointmentsByImeiNo.dart';

Future<List<Log>> getLawyerAppointsmentByImeiNo(imei) async {
  var api =
      'http://10.0.2.2:3000/getLawyerAppointmentsByImeiNo/api/fu_mobile/Get_LawyerAppointments_ByImeiNo/$imei';
  var result = await Dio().get(api);
  print(result.data);
  if (Data.fromJson(result.data).log.isNotEmpty) {
    return Data.fromJson(result.data).log;
  } else {
    List<Log> log = [];
    log.add(Data.fromJson(result.data).log2);
    return log;
  }
}
