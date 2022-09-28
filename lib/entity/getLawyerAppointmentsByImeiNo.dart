class Data {
  late List<Log> log;
  late Log log2;

  Data({required this.log, required this.log2});

  Data.fromJson(Map<String, dynamic> json) {
    try {
      log = <Log>[];
      json['data'].forEach((v) {
        log.add(new Log.fromJson(v));
      });
    } catch (e) {
      print("e");
      log2 = Log.fromJson(json['data']);
    }
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
