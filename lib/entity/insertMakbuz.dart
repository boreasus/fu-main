class Data {
  late String log;

  Data.fromJson(Map<String, dynamic> json) {
    log = json['data'];
  }
}
