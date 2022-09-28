//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:fu_mobile/entity/InsertLawyerAppointment.dart';
import 'package:dio/dio.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<String> InsertLawyerAppointmentService(String ref, String time,
    String year, String month, String day, String category) async {
  //var api = 'https://reqres.in/api/users?page=2';
  print(ref);
  print(time);
  print(year);
  print(month);
  print(day);
  var api =
      'http://$baseUrl:3000/insertLawyerAppointment/api/fu_mobile/Insert_LawyerAppointment/$ref/$time/$year/$month/$day/$category';

  print(api);
  var result = await Dio().get(api);
  print(Data.fromJson(result.data).pushLogs.Response);

  return Data.fromJson(result.data).pushLogs.Response;
}
