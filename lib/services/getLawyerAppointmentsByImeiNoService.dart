//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/getLawyerAppointmentsByImeiNo.dart';

Future<List<Log>> getLawyerAppointsmentByImeiNo() async {
  var api =
      'http://10.0.2.2:3000/getLawyerAppointmentsByImeiNo/api/fu_mobile/Get_LawyerAppointments_ByImeiNo/A8B4084027';
  var result = await Dio().get(api);
  return Data.fromJson(result.data).log;
}
