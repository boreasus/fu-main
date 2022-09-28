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
  late String Id;
  late String Name;
  late String WebParametresi;

  Log.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    Name = json['Name'];
    WebParametresi = json['WebParametresi'];
  }
}
