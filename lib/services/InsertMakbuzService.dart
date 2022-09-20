//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:fu_mobile/entity/insertMakbuz.dart';
import 'package:dio/dio.dart';

Future<String> insertMakbuz(
  String pGuidMutabakatId,
  String pStrMakbuzNo,
  String pDateMakbuzTarihi,
  String pStrBase64AttachmentBody,
) async {
  var api =
      'http://10.0.2.2:3000/InsertMakbuz/api/fu_mobile/InsertMakbuz/$pGuidMutabakatId/$pStrMakbuzNo/$pDateMakbuzTarihi/$pStrBase64AttachmentBody';

  print(api);
  var result = await Dio().get(api);
  return Data.fromJson(result.data).log;
}