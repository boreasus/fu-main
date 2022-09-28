//http://localhost:3000/updatePin/api/fu_mobile/updatePin/8838/58657358838
import 'package:dio/dio.dart';
import 'package:fu_mobile/entity/InsertOrUpdate_Ziyaret_ByZiyaretIdService.dart';
import 'package:fu_mobile/utilities/constant.dart';

Future<Log5> InsertOrUpdateZiyaretByZiyaretId(
    pGuidNew_Banka_ZiyaretiId,
    imei,
    pDtZiyaret_Tarihi,
    pGuidSubeId,
    StrTitle,
    pStrIletisimNumarasi,
    pStrGorusulenKisininAdiSoyadi,
    pStrAylikIslemSayisi,
    pBLnRakipFirmaIleCalisiyorMu,
    pStrRakipFirmaAdi,
    pStrRakipFirmaAciklamasi,
    pIntTercihEdilmeSebebiId,
    pStrTercihEdilmeSebebi,
    pStrGenelAciklama,
    pIntIlkUygunlukNotu,
    pIntTesisAsamasindaMMNot,
    pIntTesisSonrasiMMNot,
    pIntTesisSonrasiHUNot,
    pIntTesisSonrasiETNot,
    pIntFuIletisimNot,
    pStrMusteriOneriText,
    email) async {
  var api =
      'http://$baseUrl:3000/InsertOrUpdateZiyaretByZiyaretId/api/fu_mobile/InsertOrUpdateZiyaretByZiyaretId/$pGuidNew_Banka_ZiyaretiId/$imei/$pDtZiyaret_Tarihi/$pGuidSubeId/$StrTitle/$pStrIletisimNumarasi/$pStrGorusulenKisininAdiSoyadi/$pStrAylikIslemSayisi/$pBLnRakipFirmaIleCalisiyorMu/$pStrRakipFirmaAdi/$pStrRakipFirmaAciklamasi/$pIntTercihEdilmeSebebiId/$pStrTercihEdilmeSebebi/$pStrGenelAciklama/$pIntIlkUygunlukNotu/$pIntTesisAsamasindaMMNot/$pIntTesisSonrasiMMNot/$pIntTesisSonrasiHUNot/$pIntTesisSonrasiETNot/$pIntFuIletisimNot/$pStrMusteriOneriText/$email';
  print(api);
  var result = await Dio().get(api);

  return (Data.fromJson(result.data).log5);
}
