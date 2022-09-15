//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/sendLawyerEmailMobileReport.dart';

Future<String> sendLawyerEmailMobileReportService(
    imei, startDate, endDate) async {
  var api =
      'http://10.0.2.2:3000/sendLawyerEmailMobileReport/api/fu_mobile/sendLawyerEmailMobileReport/${imei}/${startDate}/${endDate}';
  var result = await Dio().get(api);
  print(result.data);

  return Log.fromJson(result.data).log;
}
