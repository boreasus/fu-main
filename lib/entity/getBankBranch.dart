//BASE CLASS
class Data {
  late List<LogBank> log;
  Data({
    required this.log,
  });

  Data.fromJson(Map<String, dynamic> json) {
    //data = json['data'] != null ? Data.fromJson(json['data']) : null;
    log = <LogBank>[];
    json['data'].forEach((v) {
      log.add(new LogBank.fromJson(v));
    });
  }
}

//SUB CLASS
class LogBank {
  late String AccountId;
  late String Name;
  late String AccountNumber;

  LogBank.fromJson(Map<String, dynamic> json) {
    AccountId = json['AccountId'];
    Name = json['Name'];
    AccountNumber = json['AccountNumber'];
  }
}
