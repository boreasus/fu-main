class ResultImeiStr {
  late CountOfIstakib countOfIstakib;

  ResultImeiStr.fromJson(Map<String, dynamic> json) {
    countOfIstakib = CountOfIstakib.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.countOfIstakib.toJson();
    return data;
  }
}

class CountOfIstakib {
  late Donem donem;

  CountOfIstakib.fromJson(Map<String, dynamic> json) {
    donem = Donem.fromJson(json['CountOfIstakib']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variable = Map<String, dynamic>();
    variable['CountOfIstakib'] = this.donem.toJson();
    return variable;
  }
}

class Donem {
  late List<Datas> datas;
  Donem.fromJson(Map<String, dynamic> json) {
    datas = <Datas>[];
    json['Donem'].forEach((v) {
      datas.add(Datas.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variable = Map<String, dynamic>();
    variable['Donem'] = this.datas.map((v) => v.toJson()).toList();
    return variable;
  }
}

//SUB CLASS
class Datas {
  late String Yil;
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
  late String VeriNo;

  Datas(
      {required this.Yil,
      required this.Ocak,
      required this.Subat,
      required this.Mart,
      required this.Nisan,
      required this.Mayis,
      required this.Haziran,
      required this.Temmuz,
      required this.Agustos,
      required this.Eylul,
      required this.Ekim,
      required this.Kasim,
      required this.Aralik,
      required this.VeriNo});

  Datas.fromJson(Map<String, dynamic> json) {
    Yil = json['Yıl'];
    Ocak = json['Ocak'];
    Subat = json['Şubat'];
    Mart = json['Mart'];
    Nisan = json['Nisan'];
    Mayis = json['Mayıs'];
    Haziran = json['Haziran'];
    Temmuz = json['Temmuz'];
    Agustos = json['Ağustos'];
    Eylul = json['Eylül'];
    Ekim = json['Ekim'];
    Kasim = json['Kasım'];
    Aralik = json['Aralık'];
    VeriNo = json['verino'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Yıl'] = this.Yil;
    data['Ocak'] = this.Ocak;
    data['Şubat'] = this.Subat;
    data['Mart'] = this.Mart;
    data['Nisan'] = this.Nisan;
    data['Mayıs'] = this.Mayis;
    data['Haziran'] = this.Haziran;
    data['Temmuz'] = this.Temmuz;
    data['Ağustos'] = this.Agustos;
    data['Eylül'] = this.Eylul;
    data['Ekim'] = this.Ekim;
    data['Kasım'] = this.Kasim;
    data['Aralık'] = this.Aralik;
    data['verino'] = this.VeriNo;

    return data;
  }
}
