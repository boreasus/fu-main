class Data {
  Result? result;
  Data({required this.result});

  Data.fromJson(Map<String, dynamic> json) {
    result = Result.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variable = Map<String, dynamic>();
    variable['data'] = this.result!.toJson();
    return variable;
  }
}

class Result {
  late String result;
  Result({required this.result});
  Result.fromJson(Map<String, dynamic> json) {
    result = json['Result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Result'] = this.result;
    return data;
  }
}
