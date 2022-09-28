class Data {
  late List<Log> log;
  late Log log2;

  Data({required this.log});

  Data.fromJson(Map<String, dynamic> json) {
    try {
      log = <Log>[];
      json['data'].forEach((v) {
        log.add(new Log.fromJson(v));
      });
    } catch (e) {
      log2 = Log.fromJson(json['data']);
    }
  }
}

//SUB CLASS
class Log {
  late String Name;
  late String ID;

  Log.fromJson(Map<String, dynamic> json) {
    Name = json['Name'] ?? "";
    ID = json['ID'] ?? "";
  }
}
