import 'package:dio/dio.dart';

Future<String> updateStatue(String id, String statue) async {
  var api =
      'http://10.0.2.2:3000/updateStatusOfPushLog/api/fu_mobile/UpdateStatusOfPushLog/$id/$statue';
  try {
    var result = await Dio().get(api);
    return result.data['data'];
    print("UPDATE DATA USE CONTENT SERVICE");
  } catch (e) {
    return "";
  }
}
