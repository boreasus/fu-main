//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/AgreementDeals.dart';
import 'package:fu_mobile/utilities/constant.dart';

// ignore: non_constant_identifier_names
Future<Data> AgreementDealClient(String imei) async {
  var api =
      'http://$baseUrl:3000/agreementDeals/api/fu_mobile/GetYapilacakMutabakat/$imei';
  var result = await Dio().get(api);
  print(result.data);
  print(ResponseData.fromJson(result.data).hakedis.data.id);
  print(ResponseData.fromJson(result.data).hakedis.data.donem);
  return (ResponseData.fromJson(result.data).hakedis.data);
}
