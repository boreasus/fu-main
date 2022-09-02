// ignore_for_file: file_names

class DataText {
  late PushLogs pushLogs;

  DataText.fromJson(Map<String, dynamic> json) {
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
    bildirimDepartmani =
        BildirimDepartmani.fromJson(json['BildirimSablonlari']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variable = Map<String, dynamic>();
    variable['BildirimSablonlari'] = this.bildirimDepartmani;
    return variable;
  }
}

class BildirimDepartmani {
  late List<LogText> logText;

  BildirimDepartmani.fromJson(Map<String, dynamic> json) {
    logText = <LogText>[];
    json['BildirimSablonu'].forEach((v) {
      logText.add(new LogText.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variable = Map<String, dynamic>();
    variable['BildirimSablonu'] = this.logText.map((v) => v.toJson()).toList();
    return variable;
  }
}

//SUB CLASS
class LogText {
  late String ID;
  late String Name;
  late String Text;

  LogText({
    required this.ID,
    required this.Name,
    required this.Text,
  });

  LogText.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    Name = json['Adi'];
    Text = json['Text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ID'] = this.ID;
    data['Adi'] = this.Name;
    data['Text'] = this.Text;
    return data;
  }
}
