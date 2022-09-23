class PushLogs {
  late List<LogRef> log;
  late LogRef log2;

  PushLogs.fromJson(Map<String, dynamic> json) {
    try {
      log = <LogRef>[];
      json['data'].forEach((v) {
        log.add(LogRef.fromJson(v));
      });
    } catch (e) {
      print(json['data']);
      log2 = LogRef.fromJson(json['data']);
    }
  }
}

//SUB CLASS
class LogRef {
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
  LogRef(
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

  LogRef.fromJson(Map<String, dynamic> json) {
    print("bbb çalıştı");

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
