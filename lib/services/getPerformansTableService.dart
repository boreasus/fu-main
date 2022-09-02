//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/GetPerformansTable.dart';

Future<String> GetPerformanceTableClient(String imei, int i, String c) async {
  //var api = 'https://reqres.in/api/users?page=2';

  var api =
      'http://10.0.2.2:3000/getPerformanceTable/api/fu_mobile/GetPerformansTablosu/$imei';
  var result = await Dio().get(api);
  if (c == 'o') {
    return ResultImeiStr.fromJson(result.data)
        .countOfIstakib
        .donem
        .datas[i]
        .Ocak;
  } else if (c == 'ş') {
    return ResultImeiStr.fromJson(result.data)
        .countOfIstakib
        .donem
        .datas[i]
        .Subat;
  } else if (c == 'mt') {
    return ResultImeiStr.fromJson(result.data)
        .countOfIstakib
        .donem
        .datas[i]
        .Mart;
  } else if (c == 'n') {
    return ResultImeiStr.fromJson(result.data)
        .countOfIstakib
        .donem
        .datas[i]
        .Nisan;
  } else if (c == 'ms') {
    return ResultImeiStr.fromJson(result.data)
        .countOfIstakib
        .donem
        .datas[i]
        .Mayis;
  } else if (c == 'h') {
    return ResultImeiStr.fromJson(result.data)
        .countOfIstakib
        .donem
        .datas[i]
        .Haziran;
  } else if (c == 't') {
    return ResultImeiStr.fromJson(result.data)
        .countOfIstakib
        .donem
        .datas[i]
        .Temmuz;
  } else if (c == 'as') {
    return ResultImeiStr.fromJson(result.data)
        .countOfIstakib
        .donem
        .datas[i]
        .Agustos;
  } else if (c == 'el') {
    return ResultImeiStr.fromJson(result.data)
        .countOfIstakib
        .donem
        .datas[i]
        .Eylul;
  } else if (c == 'em') {
    return ResultImeiStr.fromJson(result.data)
        .countOfIstakib
        .donem
        .datas[i]
        .Ekim;
  } else if (c == 'k') {
    return ResultImeiStr.fromJson(result.data)
        .countOfIstakib
        .donem
        .datas[i]
        .Kasim;
  } else if (c == 'ak') {
    return ResultImeiStr.fromJson(result.data)
        .countOfIstakib
        .donem
        .datas[i]
        .Aralik;
  } else
    return "";
}
