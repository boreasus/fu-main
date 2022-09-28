//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:fu_mobile/entity/CheckPin.dart';
import 'package:dio/dio.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<String> checkPinClient(String tckn, String password) async {
  //var api = 'https://reqres.in/api/users?page=2';

  var api =
      'http://$baseUrl:3000/checkPin/api/fu_mobile/CheckPin/$password/$tckn';
  var result = await Dio().get(api);
  print(Data.fromJson(result.data).sub!.Result);
  return (Data.fromJson(result.data).sub!.Result);
}
