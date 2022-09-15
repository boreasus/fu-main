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
  late String BankaAdi;
  late String Ocak;
  late String Subat;
  late String Mart;
  late String Nisan;
  late String Mayis;
  late String Haziran;
  late String Temmuz;
  late String Agustos;
  late String Eylul;
  late String Ekim;
  late String Kasim;
  late String Aralik;

  Log(this.BankaAdi);

  Log.fromJson(Map<String, dynamic> json) {
    BankaAdi = json['BankaAdı'];
    Ocak = json['Oc'] ?? "-";
    Subat = json['Şu'] ?? "-";
    Mart = json['Ma'] ?? "-";
    Nisan = json['Ni'] ?? "-";
    Mayis = json['May'] ?? "-";
    Haziran = json['Ha'] ?? "-";
    Temmuz = json['Te'] ?? "-";
    Agustos = json['Ağ'] ?? "-";
    Eylul = json['Ey'] ?? "-";
    Ekim = json['Ek'] ?? "-";
    Kasim = json['Ka'] ?? "-";
    Aralik = json['Ar'] ?? "-";
  }
}
