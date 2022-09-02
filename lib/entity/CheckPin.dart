class Data {
  Sub? sub;
  Data({required this.sub});

  Data.fromJson(Map<String, dynamic> json) {
    sub = Sub.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variable = Map<String, dynamic>();
    variable['data'] = this.sub!.toJson();
    return variable;
  }
}

class Sub {
  Sub({required this.Result});
  late String Result;
  Sub.fromJson(Map<String, dynamic> json) {
    Result = json['Result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Result'] = this.Result;
    return data;
  }
}
