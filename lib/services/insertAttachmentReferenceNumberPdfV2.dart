//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/insertAttachmentReferenceNum.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<String> insertAttachmentNum(
    fuRefNo, filename, base64, date, type) async {
  print(">>>>>>>>>>>>>>>>>> $date");
  var api =
      'http://$baseUrl:3000/insertAttachmentReferenceNumberPdfV2/api/fu_mobile/Insert_Attachment_With_Reference_Number_PDF_V2/$fuRefNo/$filename/$base64/$date/$type';
  var result = await Dio().get(api);

  return Data.fromJson(result.data).log;
}
