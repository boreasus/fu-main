//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/GetPerformansTable.dart';

Future<List<Datas>> GetPerformanceTableClient(String imei) async {
  //var api = 'https://reqres.in/api/users?page=2';

  var api =
      'http://10.0.2.2:3000/getPerformanceTable/api/fu_mobile/GetPerformansTablosu/$imei';
  var result = await Dio().get(api);
  if ((ResultImeiStr.fromJson(result.data).countOfIstakib.donem.datas)
      .isNotEmpty) {
    return ResultImeiStr.fromJson(result.data).countOfIstakib.donem.datas;
  } else {
    List<Datas> datas = [];
    datas.add(ResultImeiStr.fromJson(result.data).countOfIstakib.donem.datas2);
    return datas;
  }
}
