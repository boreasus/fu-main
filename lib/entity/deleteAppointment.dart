class data {
  late String log;

  data.fromJson(Map<String, dynamic> json) {
    log = json['data'] ?? "err";
  }
}
