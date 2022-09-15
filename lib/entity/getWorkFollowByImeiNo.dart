class Data {
  late List<Log> log;
  late Log log2;

  Data({required this.log});

  Data.fromJson(Map<String, dynamic> json) {
    try {
      log = <Log>[];
      json['data'].forEach((v) {
        log.add(new Log.fromJson(v));
      });
    } catch (e) {
      log2 = Log.fromJson(json['data']);
      print("bura calisti");
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
  late String SiraNo;
  late String New_FuReferansNo;
  late String IslemSube;
  late String IslemAdi;
  late String IslemTarih;
  late String IslemSaat;
  late String NetFiyat;
  late String BrutFiyat;
  late String KDV;
  late String Stopaj;
  late String Hakedis;

  Log.fromJson(Map<String, dynamic> json) {
    SiraNo = json['SıraNo'];
    New_FuReferansNo = json['New_FuReferansNo'];
    IslemSube = json['IslemSube'];
    IslemAdi = json['IslemAdi'];
    IslemTarih = json['IslemTarih'];
    IslemSaat = json['IslemSaat'];
    NetFiyat = json['NetFiyat'];
    BrutFiyat = json['BrütFiyat'];
    KDV = json['KDV'];
    Stopaj = json['Stopaj'];
    Hakedis = json['Hakedis'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['SıraNo'] = this.SiraNo;
    data['New_FuReferansNo'] = this.New_FuReferansNo;
    data['IslemSube'] = this.IslemSube;
    data['IslemAdi'] = this.IslemAdi;
    data['IslemTarih'] = this.IslemTarih;
    data['IslemSaat'] = this.IslemSaat;
    data['NetFiyat'] = this.NetFiyat;
    data['BrütFiyat'] = this.BrutFiyat;
    data['KDV'] = this.KDV;
    data['Stopaj'] = this.Stopaj;
    data['Hakedis'] = this.Hakedis;

    return data;
  }
}
