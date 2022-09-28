/*
{
  "data": {
    "Hakedis": {
      "New_mutabakattalebiId": "8eb2a4a3-a3c1-48f1-a3ec-3376eee5b0a7",
      "Dönem": "30/06/2022-31/07/2022",
      "İşlemSayısı": "2",
      "BRÜTTUTAR": "112,5",
      "STOPAJTL": "22,5",
      "KDV": "20,25",
      "NETKAZANÇ": "90",
      "MutabakatDurumu": "3"
    }
  }
}
*/

//BASE CLASS
class ResponseData {
  late Hakedis hakedis;
  ResponseData({
    required this.hakedis,
  });
  ResponseData.fromJson(Map<String, dynamic> json) {
    hakedis = Hakedis.fromJson(json['data']);
  }
}

class Hakedis {
  late Data data;
  Hakedis({
    required this.data,
  });
  Hakedis.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['Hakedis']);
  }
}

class Data {
  late String id;
  late String donem;
  late String islem;
  late String brut;
  late String stopaj;
  late String kdv;
  late String netkazanc;
  late String mutabakat;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['New_mutabakattalebiId'] ?? "";
    donem = json['Dönem'] ?? "";
    islem = json['İşlemSayısı'] ?? "";
    brut = json['BRÜTTUTAR'] ?? "";
    stopaj = json['STOPAJTL'] ?? "";
    kdv = json['KDV'] ?? "";
    netkazanc = json['NETKAZANÇ'] ?? "";
    mutabakat = json['MutabakatDurumu'] ?? "";
  }
}


//agreementDeals/api/fu_mobile/GetYapilacakMutabakat/A8B4084027