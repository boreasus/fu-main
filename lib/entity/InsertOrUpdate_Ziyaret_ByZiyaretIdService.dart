class Data {
  late Log5 log5;

  Data.fromJson(Map<String, dynamic> json) {
    log5 = Log5.fromJson(json['data']);
  }
}

class Log5 {
  late String result;
  late String strResult;

  Log5.fromJson(Map<String, dynamic> json) {
    result = json['InsertOrUpdate_Ziyaret_ByZiyaretIdResult'];
    strResult = json['strResult'];
  }
}
