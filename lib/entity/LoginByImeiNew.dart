class Data {
  late List<Log> log;
  late Log log2;

  Data.fromJson(Map<String, dynamic> json) {
    try {
      log = <Log>[];
      json['data'].forEach((v) {
        log.add(Log.fromJson(v));
      });
    } catch (e) {
      log2 = Log.fromJson(json['data']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variable = Map<String, dynamic>();
    variable['data'] = this.log.map((v) => v.toJson()).toList();
    return variable;
  }
}

//SUB CLASS
class Log {
  late String Ad;
  late String FullName;
  late String New_FuReferansNo;
  late String New_TapuRandevuTarihi;
  late String CreatedOn;
  late String New_IsinTipi;
  late String VeriKullanimIzni;
  late String Category;

  Log(
      {required this.Ad,
      required this.FullName,
      required this.New_FuReferansNo,
      required this.New_TapuRandevuTarihi,
      required this.CreatedOn,
      required this.New_IsinTipi,
      required this.VeriKullanimIzni});

  Log.fromJson(Map<String, dynamic> json) {
    Ad = json['Ad'];
    FullName = json['FullName'];
    New_FuReferansNo = json['New_FuReferansNo'];
    New_TapuRandevuTarihi = json['New_TapuRandevuTarihi'];
    CreatedOn = json['CreatedOn'];
    New_IsinTipi = json['New_IsinTipi'];
    VeriKullanimIzni = json['VeriKullanimIzni'];
    Category = json['Category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Ad'] = this.Ad;
    data['FullName'] = this.FullName;
    data['New_FuReferansNo'] = this.New_FuReferansNo;
    data['New_TapuRandevuTarihi'] = this.New_TapuRandevuTarihi;
    data['CreatedOn'] = this.CreatedOn;
    data['New_IsinTipi'] = this.New_IsinTipi;
    data['VeriKullanimIzni'] = this.VeriKullanimIzni;

    return data;
  }
}
