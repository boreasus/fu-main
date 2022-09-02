class Data {
  late PushLogs pushLogs;

  Data.fromJson(Map<String, dynamic> json) {
    pushLogs = PushLogs.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.pushLogs;
    return data;
  }
}

class PushLogs {
  late BildirimDepartmani bildirimDepartmani;

  PushLogs.fromJson(Map<String, dynamic> json) {
    bildirimDepartmani = BildirimDepartmani.fromJson(json['PushLogs']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variable = Map<String, dynamic>();
    variable['PushLogs'] = this.bildirimDepartmani;
    return variable;
  }
}

class BildirimDepartmani {
  late List<Log> log;

  BildirimDepartmani.fromJson(Map<String, dynamic> json) {
    log = <Log>[];
    json['BildirimDepartmani'].forEach((v) {
      log.add(new Log.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variable = Map<String, dynamic>();
    variable['BildirimDepartmani'] = this.log.map((v) => v.toJson()).toList();
    return variable;
  }
}

//SUB CLASS
class Log {
  late String ID;
  late String Name;

  Log({
    required this.ID,
    required this.Name,
  });

  Log.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    Name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ID'] = this.ID;
    data['Name'] = this.Name;
    return data;
  }
}
