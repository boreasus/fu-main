class Data {
  late IsTakibi isTakibi;

  Data.fromJson(Map<String, dynamic> json) {
    print("1");
    isTakibi = IsTakibi.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.isTakibi.toJson();
    print("11");
    print(data);

    return data;
  }
}

class IsTakibi {
  late List<Log> log;
  late Log logSingle;

  IsTakibi.fromJson(Map<String, dynamic> json) {
    print("2.<<");
    log = <Log>[];
    try {
      json['IsTakibi'].forEach((v) {
        log.add(Log.fromJson(v));
      });
    } catch (e) {
      logSingle = Log.fromJson(json['IsTakibi']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variable = Map<String, dynamic>();
    variable['IsTakibi'] = this.log.map((v) => v.toJson()).toList();
    return variable;
  }
}

//SUB CLASS
class Log {
  late String New_FuReferansNo;
  late String New_name;

  Log({
    required this.New_FuReferansNo,
    required this.New_name,
  });

  Log.fromJson(Map<String, dynamic> json) {
    New_FuReferansNo = json['New_FuReferansNo'];
    New_name = json['New_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['New_FuReferansNo'] = this.New_FuReferansNo;
    data['New_name'] = this.New_name;

    return data;
  }
}
