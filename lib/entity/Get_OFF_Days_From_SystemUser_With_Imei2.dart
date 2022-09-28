class Data {
  late Log log;

  Data.fromJson(Map<String, dynamic> json) {
    log = Log.fromJson(json['data']);
  }
}

class Log {
  late String BaslangicTarihi;
  late String BitisTarihi;

  Log({
    required this.BaslangicTarihi,
    required this.BitisTarihi,
  });

  Log.fromJson(Map<String, dynamic> json) {
    BaslangicTarihi = json['BaslangicTarihi'] ?? "";
    BitisTarihi = json['BitisTarihi'] ?? "";
  }
}
