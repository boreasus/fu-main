class Data {
  late MobileUygulamaAksiyonlari mobileUygulamaAksiyonlari;

  Data.fromJson(Map<String, dynamic> json) {
    mobileUygulamaAksiyonlari =
        MobileUygulamaAksiyonlari.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.mobileUygulamaAksiyonlari;

    return data;
  }
}

class MobileUygulamaAksiyonlari {
  late Aksiyon aksiyon;

  MobileUygulamaAksiyonlari.fromJson(Map<String, dynamic> json) {
    aksiyon = Aksiyon.fromJson(json['MobileUygulamaAksiyonlari']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['MobileUygulamaAksiyonlari'] = this.aksiyon;

    return data;
  }
}

class Aksiyon {
  late List<Log2> log;
  late Log2 log2;

  Aksiyon({required this.log});

  Aksiyon.fromJson(Map<String, dynamic> json) {
    try {
      log = <Log2>[];
      json['Aksiyon'].forEach((v) {
        log.add(new Log2.fromJson(v));
      });
    } catch (e) {
      log2 = json['Aksiyon'];
    }
  }
}

//SUB CLASS
class Log2 {
  late String Adi;
  late String No;
  late String BankaId;
  late String IsPhoto;
  late String FileName;

  Log2(this.Adi);

  Log2.fromJson(Map<String, dynamic> json) {
    Adi = json['Adi'];
    No = json['No'];
    BankaId = json['BankaId'];
    IsPhoto = json['IsPhoto'];
    FileName = json['FileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Adi'] = this.Adi;
    data['No'] = this.No;
    data['BankaId'] = this.BankaId;
    data['IsPhoto'] = this.IsPhoto;
    data['FileName'] = this.FileName;
    return data;
  }
}
