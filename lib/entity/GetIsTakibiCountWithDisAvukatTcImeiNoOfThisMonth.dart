class Data2 {
  late List<LogText> logText;
  late LogText? logText2;
  // late LogText logText;

  Data2({
    required this.logText,
  });

  Data2.fromJson(Map<String, dynamic> json) {
    logText = <LogText>[];
    print("json");
    print(json['data']);
    try {
      json['data'].forEach((v) {
        logText.add(new LogText.fromJson(v));
      });
    } catch (e) {
      logText2 = LogText.fromJson(json['data']);
    }
  }

  // Data2.fromJson(Map<String, dynamic> json) {
  //   logText = LogText.fromJson(json['data']);
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variable = Map<String, dynamic>();
    variable['data'] = this.logText2!.toJson();

    variable['data'] = this.logText.map((v) => v.toJson()).toList();

    return variable;
  }
}

/*{
  "data": {
    "BankaAdı": "AKBANK A.Ş.",
    "Oc": "-",
    "Şu": "-",
    "Ma": "-",
    "Ni": "-",
    "May": "-",
    "Ha": "1",
    "Te": "-",
    "Ağ": "-"
  }
} */

//SUB CLASS
class LogText {
  late String BankaAdi;
  late String Oc;
  late String Su;
  late String Ma;
  late String Ni;
  late String May;
  late String Ha;
  late String Te;
  late String Ag;

  LogText({
    required this.BankaAdi,
    required this.Oc,
    required this.Su,
  });

  LogText.fromJson(Map<String, dynamic> json) {
    BankaAdi = json['BankaAdı'];
    Oc = json['Oc'];
    Su = json['Şu'];
    Ma = json['Ma'];
    Ni = json['Ni'];
    May = json['May'];
    Ha = json['Ha'];
    Te = json['Te'];
    Ag = json['Ağ'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['BankaAdı'] = this.BankaAdi;
    data['Oc'] = this.Oc;
    data['Şu'] = this.Su;
    data['Ma'] = this.Ma;
    data['Ni'] = this.Ni;
    data['May'] = this.May;
    data['Ha'] = this.Ha;
    data['Te'] = this.Te;
    data['Ag'] = this.Ag;
    return data;
  }
}
