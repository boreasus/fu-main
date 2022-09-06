class Data {
  late List<Log> log;

  Data({required this.log});

  Data.fromJson(Map<String, dynamic> json) {
    log = <Log>[];
    json['data'].forEach((v) {
      log.add(new Log.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variable = Map<String, dynamic>();
    variable['data'] = this.log.map((v) => v.toJson()).toList();

    return variable;
  }
}

//SUB CLASS
class Log {
  late String IslemTarih;
  late String IslemSaat;
  late String AnaBanka;
  late String Sube;
  late String IslemAd;
  late String NewRandevuId;
  late String NewFuReferansNo;

  Log.fromJson(Map<String, dynamic> json) {
    IslemTarih = json['IslemTarih'];
    IslemSaat = json['IslemSaat'];
    AnaBanka = json['AnaBanka'];
    Sube = json['Sube'];
    IslemAd = json['IslemAd'];
    NewRandevuId = json['New_randevuId'];
    NewFuReferansNo = json['New_FuReferansNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['IslemTarih'] = this.IslemTarih;
    data['IslemSaat'] = this.IslemSaat;
    data['AnaBanka'] = this.AnaBanka;
    data['Sube'] = this.Sube;
    data['IslemAd'] = this.IslemAd;
    data['New_randevuId'] = this.NewRandevuId;
    data['New_FuReferansNo'] = this.NewFuReferansNo;
    return data;
  }
}
