//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:fu_mobile/entity/UpdatePin.dart';
import 'package:dio/dio.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<String> UpdatePinClient(String tckn, String password) async {
  //var api = 'https://reqres.in/api/users?page=2';

  var api =
      'http://$baseUrl:3000/updatePin/api/fu_mobile/updatePin/$tckn/$password';
  var result = await Dio().get(api);
  var response = Data.fromJson(result.data).result!.result;
  return (response.toString());
}
