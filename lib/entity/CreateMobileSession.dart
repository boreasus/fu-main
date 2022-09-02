class Log {
  late String session;

  Log({
    required this.session,
  });

  Log.fromJson(Map<String, dynamic> json) {
    session = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.session;
    return data;
  }
}
