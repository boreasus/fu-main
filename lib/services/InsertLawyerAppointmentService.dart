//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:fu_mobile/entity/InsertLawyerAppointment.dart';
import 'package:dio/dio.dart';

Future<String> InsertLawyerAppointmentService(
    String ref, String time, String year, String month, String day) async {
  //var api = 'https://reqres.in/api/users?page=2';
  print(ref);
  print(time);
  print(year);
  print(month);
  print(day);
  var api =
      'http://10.0.2.2:3000/insertLawyerAppointment/api/fu_mobile/Insert_LawyerAppointment/$ref/$time/$year/$month/$day';

  print(api);
  var result = await Dio().get(api);
  print(Data.fromJson(result.data).pushLogs.Response);

  return Data.fromJson(result.data).pushLogs.Response;
}
