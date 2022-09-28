class Data {
  late IsTakip isTakip;

  Data.fromJson(Map<String, dynamic> json) {
    print("data calisti");

    isTakip = IsTakip.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.isTakip;

    return data;
  }
}

class IsTakip {
  late Log log;

  IsTakip.fromJson(Map<String, dynamic> json) {
    print("istakip calisti");
    log = Log.fromJson(json['IsTakip']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> variable = Map<String, dynamic>();
    variable['IsTakip'] = this.log;

    return variable;
  }
}

//SUB CLASS
class Log {
  late String SartliUN;
  late String Musteri;
  late String Malik;
  late String Il;
  late String Ilce;
  late String Mahalle;
  late String Ada;
  late String Parsel;
  late String BlokNo;
  late String BagBol;
  late String ArsaPayi;
  late String KatNo;
  late String BagBolNit;
  late String HSBCEnAzSatisTutari;
  late String IpotekBedeli;
  late String IpotekPB;
  late String Kredif;
  late String KredifDegisken;
  late String IpotekD;
  late String RandTarihi;
  late String CepTel;
  late String EnErkenIpotek;
  late String NitelikAcik;
  late String Sorumlu;
  late String Sorumlu0;
  late String Soruml1;
  late String Cek;
  late String RandSahibi;
  late String SaticiAdi;
  late String BankaAciklamasi;
  late String FekBed;
  late String FekPB;
  late String EnErkenFekTarihi;
  // Log(
  //     {required this.SartliUN,
  //     required this.Musteri,
  //     required this.Malik,
  //     required this.Il,
  //     required this.Ilce,
  //     required this.Mahalle,
  //     required this.Ada});

  Log.fromJson(Map<String, dynamic> json) {
    print("json calisti");
    SartliUN = json['ŞartlıU.N.'];
    print("1");

    Musteri = json['Müşteri'] ?? "";
    Malik = json['Malik'] ?? "";
    Il = json['İl'] ?? "";
    Ilce = json['İlçe'] ?? "";
    Mahalle = json['Mahalle'] ?? "";
    Ada = json['Ada'] ?? "";
    Parsel = json['Parsel'] ?? "";
    BlokNo = json['BlokNo'] ?? "";
    BagBol = json['Bağ.Böl.'] ?? "";
    ArsaPayi = json['ArsaPayı'] ?? "";
    KatNo = json['KatNo'] ?? "";
    BagBolNit = json['BağBölNit'] ?? "";
    HSBCEnAzSatisTutari = json['HSBCEnAzSatisTutari'] ?? "";
    IpotekBedeli = json['İpotekBed.'] ?? "";
    IpotekPB = json['İpotekPB'] ?? "";
    Kredif = json['KrediF.O.'] ?? "";
    KredifDegisken = json['KrediF.O.Degisken'] ?? "";
    IpotekD = json['İpotekD.'] ?? "";
    RandTarihi = json['Rand.Tar.'] ?? "";
    CepTel = json['CepTelNo'] ?? "";
    EnErkenIpotek = json['EnErkenİpotekTarihi'] ?? "";
    NitelikAcik = json['NitelikAçık'] ?? "";
    Sorumlu = json['Sorumlu.'] ?? "";
    Sorumlu0 = json['Sorumlu..'] ?? "";
    Soruml1 = json['Sorumlu..1'] ?? "";
    Cek = json['Çek'] ?? "";
    RandSahibi = json['RandSahibi'] ?? "";
    SaticiAdi = json['SatıcıAdı'] ?? "";
    BankaAciklamasi = json['BankaAciklamasi'] ?? "";
    FekBed = json['FekBed.'] ?? "";
    FekPB = json['FekPB'] ?? "";
    EnErkenFekTarihi = json['EnErkenFekTarihi'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ŞartlıU.N.'] = this.SartliUN;
    data['Müşteri'] = this.Musteri;
    data['Malik'] = this.Malik;
    data['İl'] = this.Il;
    data['İlçe'] = this.Ilce;
    data['Mahalle'] = this.Mahalle;
    data['Ada'] = this.Ada;
    data['Parsel'] = this.Parsel;
    data['BlokNo'] = this.BlokNo;
    data['Bağ.Böl.'] = this.BagBol;
    data['ArsaPayı'] = this.ArsaPayi;
    data['KatNo'] = this.KatNo;
    data['BağBölNit'] = this.BagBolNit;
    data['HSBCEnAzSatisTutari'] = this.HSBCEnAzSatisTutari;
    data['İpotekBed'] = this.IpotekBedeli;
    data['İpotekPB'] = this.IpotekPB;
    data['KrediF.O.'] = this.Kredif;
    data['KrediF.O.Degisken'] = this.KredifDegisken;
    data['İpotekD.'] = this.IpotekD;
    data['Rand.Tar.'] = this.RandTarihi;
    data['CepTelNo'] = this.CepTel;
    data['EnErkenİpotekTarihi'] = this.EnErkenIpotek;
    data['NitelikAçık'] = this.NitelikAcik;
    data['Sorumlu.'] = this.Sorumlu;
    data['Sorumlu..'] = this.Sorumlu0;
    data['Sorumlu..1'] = this.Soruml1;
    data['Çek'] = this.Cek;
    data['RandSahibi'] = this.RandSahibi;
    data['SatıcıAdı'] = this.SaticiAdi;
    data['BankaAciklamasi'] = this.BankaAciklamasi;

    return data;
  }
}
