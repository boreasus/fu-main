//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/utilities/constant.dart';
import '../entity/deleteAppointment.dart';

Future<String> deleteAppointment(
    String fuRefNo, String unic, String neden) async {
  //var api = 'https://reqres.in/api/users?page=2';

  var api =
      'http://$baseUrl:3000/deleteLawyerAppointment/api/fu_mobile/deleteLawyerAppointment/$fuRefNo/$unic/$neden';
  var result = await Dio().get(api);

  return data.fromJson(result.data).log;
}
