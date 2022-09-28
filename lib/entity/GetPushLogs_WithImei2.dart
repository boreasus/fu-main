class ResultImeiStr {
  late ResultIMEI2 resultIMEI2;

  ResultImeiStr.fromJson(Map<String, dynamic> json) {
    resultIMEI2 = ResultIMEI2.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.resultIMEI2.toJson();
    return data;
  }
}

class ResultIMEI2 {
  late PushLogs pushLogs;

  ResultIMEI2.fromJson(Map<String, dynamic> json) {
    pushLogs = PushLogs.fromJson(json['PushLogs']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['PushLogs'] = this.pushLogs.toJson();
    return data;
  }
}

class PushLogs {
  late Log log2;
  late List<Log> log;

  PushLogs.fromJson(Map<String, dynamic> json) {
    try {
      log = <Log>[];
      json['Log'].forEach((v) {
        log.add(Log.fromJson(v));
      });
    } catch (e) {
      log2 = json['Log'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variable = Map<String, dynamic>();
    variable['Log'] = this.log.map((v) => v.toJson()).toList();
    return variable;
  }
}

//SUB CLASS
class Log {
  late String Category;
  late String MessageStatus;
  late String PushId;
  late String Title;
  late String Content;
  late String IsTakibiId;
  late String LawyerId;
  late String statuscode;
  late String SendingDate;
  late String PushLogId;
  Log(
      {required this.Category,
      required this.MessageStatus,
      required this.PushId,
      required this.Title,
      required this.Content,
      required this.IsTakibiId,
      required this.LawyerId,
      required this.statuscode,
      required this.SendingDate,
      required this.PushLogId});

  Log.fromJson(Map<String, dynamic> json) {
    Category = json['Category'] ?? "";
    MessageStatus = json['MessageStatus'] ?? "";
    PushId = json['PushId'] ?? "";
    Title = json['Title'] ?? "";
    Content = json['Content'] ?? "";
    IsTakibiId = json['IsTakibiId'] ?? "";
    LawyerId = json['LawyerId'] ?? "";
    statuscode = json['statuscode'] ?? "";
    SendingDate = json['SendingDate'] ?? "";
    PushLogId = json['PushLogId'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Category'] = this.Category;
    data['MessageStatus'] = this.MessageStatus;
    data['PushId'] = this.PushId;
    data['Title'] = this.Title;
    data['Content'] = this.Content;
    data['IsTakibiId'] = this.IsTakibiId;
    data['LawyerId'] = this.LawyerId;
    data['statuscode'] = this.statuscode;
    data['SendingDate'] = this.SendingDate;
    data['PushLogId'] = this.PushLogId;
    return data;
  }
}
