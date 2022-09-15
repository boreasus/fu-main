//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/getBankBranch.dart';

Future<List<LogBank>> getBankBranchService(id) async {
  var api =
      'http://10.0.2.2:3000/getBankBranch/api/fu_mobile/getBankBranch/$id';
  var result = await Dio().get(api);
  print(result.data);

  return Data.fromJson(result.data).log;
}