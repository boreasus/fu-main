import 'package:flutter/material.dart';
import 'package:fu_mobile/screens/activation.dart';
import 'package:fu_mobile/utilities/constant.dart';
import 'package:fu_mobile/services/updateDataUseContentService.dart';

class Pdpa extends StatefulWidget {
  const Pdpa({Key? key}) : super(key: key);

  @override
  State<Pdpa> createState() => _PdpaState();
}

class _PdpaState extends State<Pdpa> {
  bool isChecked = false;
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BODY
      backgroundColor: bgColor,
      body: Container(
        padding: EdgeInsets.all(12),
        child: Stack(
          // fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment(0.0, -0.8),
              child: buildScreenHeader(),
            ),
            Align(
              alignment: Alignment(0.0, -0.4),
              child: buildScreenDesc(),
            ),
            Align(
              alignment: Alignment(0.0, 0.0),
              child: buildScreenBtn(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        alignment: FractionalOffset(.5, 1.0),
        children: [
          Container(
            height: 100,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: buildScreenButton(),
          ),
        ],
      ),
    );
  }

  Widget buildScreenHeader() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 0.1),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: primaryGray,
                  width: 0.5,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: 25, left: 10, right: 10),
              child: Text(
                'FU GAYRİMENKUL YATIRIM DANIŞMANLIK A.Ş KİŞİSEL VERİLERİN KULLANIMINA İLİŞKİN AÇIK RIZA METNİ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      );

  Widget buildScreenDesc() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 0.1),
          // ignore: avoid_unnecessary_containers
          Container(
            child: Padding(
              padding: EdgeInsets.only(bottom: 0, left: 10, right: 10, top: 25),
              child: Text(
                'FU Gayrimenkul Yatırım Danışmanlık A.Ş (“FU” veya “şirket”) tarafından, 6698 sayılı Kişisel Verilerin Korunması Kanunu (“KVKK”)’nın “Veri Sorumlusununn Aydınlatma Yükümlülüğü” başlıklı 11. maddesi uyarınca “FU Gayrimenkul Yatırım Danışmanlık A.Ş. Kişisel Verilerin Korunması Hakkında Aydınlatma Metni” aracılığıyla 08/05/2020 tarihinde işlenen kişisel verileriniz hakkında bilgilendirildiniz ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xff7C7C7C),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      );
  Widget buildScreenBtn() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 120.0, 60.0, 0.0),
            child: Row(
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                TextButton(
                  onPressed: () => _showMyDialogRights(context),
                  child: Text(
                    'Kişisel verilerin korunması hakkında\naydınlatma metnini okudum, onaylıyorum',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  Widget buildScreenButton() => SizedBox(
        width: 300,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: primaryBrand,
            minimumSize: const Size.fromHeight(50),
          ),
          onPressed: () {
            isChecked
                ? {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (constext) => Activation(),
                      ),
                    ),
                    updateDataUseContentService("A8B4084027"),
                  }
                : _showMyDialog(context);
          },
          child: Text(
            'Onaylıyorum',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      );
}

Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Uyarı'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                  'Kişisel verilerin korunması hakkında aydınlatma metnini onaylamadan devam edemezsiniz.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Tamam'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _showMyDialogReadApproved(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Uyarı'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text(
                  'Kişisel verilerin korunması hakkında aydınlatma metnini onaylamadan devam edemezsiniz.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Tamam'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _showMyDialogRights(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!

    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Uyarı'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              SingleChildScrollView(
                child: Text(rights),
              )
            ],
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: primaryBrand,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                'Tamam',
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}
