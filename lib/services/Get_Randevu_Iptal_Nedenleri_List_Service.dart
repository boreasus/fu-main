//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/utilities/constant.dart';
import '../entity/Get_Randevu_Iptal_Nedenleri_List.dart';

Future<List<Log>> getRandevuIptalNedenleri(fuRefNo, date) async {
  var api =
      'http://$baseUrl:3000/getCancelAppointment/api/fu_mobile/Get_Randevu_Iptal_Nedenleri_List/$fuRefNo/$date';
  var result = await Dio().get(api);
  print(result.data);

  if (Data.fromJson(result.data).log.isNotEmpty) {
    return Data.fromJson(result.data).log;
  } else {
    List<Log> log = [];
    log.add(Data.fromJson(result.data).log2);
    return log;
  }
}
