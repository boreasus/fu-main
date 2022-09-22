class Data {
  late String log;
  Data({required this.log});

  Data.fromJson(Map<String, dynamic> json) {
    log = json['data'];
    print("class $log");
  }
}
