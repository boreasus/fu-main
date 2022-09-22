//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import '../entity/updateAccount.dart';

Future<String> updateAccount(String id) async {
  //var api = 'https://reqres.in/api/users?page=2';

  var api =
      'http://10.0.2.2:3000/updateAccounterSend/api/fu_mobile/UpdateMutabakatMuhasebeOnayinaGonder/$id';
  var result = await Dio().get(api);
  print(result.data);
  print(api);
  return (Data.fromJson(result.data).log);
}
