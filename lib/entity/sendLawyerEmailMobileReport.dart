class Log {
  late String log;

  Log.fromJson(Map<String, dynamic> json) {
    log = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.log;

    return data;
  }
}
