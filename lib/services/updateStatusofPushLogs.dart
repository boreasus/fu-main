import 'package:dio/dio.dart';

Future<void> updateStatue(String id, String statue) async {
  var api =
      'http://10.0.2.2:3000/updateStatusOfPushLog/api/fu_mobile/UpdateStatusOfPushLog/$id/$statue';
  try {
    var result = await Dio().get(api);
    print("UPDATE DATA USE CONTENT SERVICE");
  } catch (e) {
    print(e);
  }
}
