//BASE CLASS
class Data {
  late List<Log> log;
  Data({
    required this.log,
  });

  Data.fromJson(Map<String, dynamic> json) {
    //data = json['data'] != null ? Data.fromJson(json['data']) : null;
    log = <Log>[];
    json['data'].forEach((v) {
      log.add(new Log.fromJson(v));
    });
  }
}

//SUB CLASS
class Log {
  late String New_anabankaidName;
  late String New_BankaIdName;
  late String Adet;

  Log.fromJson(Map<String, dynamic> json) {
    New_anabankaidName = json['New_anabankaidName'];
    New_BankaIdName = json['New_BankaIdName'];
    Adet = json['Adet'];
  }
}
