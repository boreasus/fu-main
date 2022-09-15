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
    }
  }
}

//SUB CLASS
class Log {
  late String New_Ziyaret_Tarihi;
  late String SubeID;
  late String Tanim;
  late String New_Banka_ZiyaretiId;
  late String Hedeflenen_Ziyaret_Sayisi;
  late String Hedeflenen_Ziyaret_Tarihi;
  late String Ziyaret_Gerceklestirildimi;

  Log.fromJson(Map<String, dynamic> json) {
    New_Ziyaret_Tarihi = json['New_Ziyaret_Tarihi'];
    SubeID = json['SubeID'];
    Tanim = json['Tanim'];
    New_Banka_ZiyaretiId = json['New_Banka_ZiyaretiId'];
    Hedeflenen_Ziyaret_Sayisi = json['Hedeflenen_Ziyaret_Sayisi'];
    Hedeflenen_Ziyaret_Tarihi = json['Hedeflenen_Ziyaret_Tarihi'];
    Ziyaret_Gerceklestirildimi = json['Ziyaret_Gerceklestirildimi'];
  }
}
