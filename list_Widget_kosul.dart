import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Myapp()));
}

class Myapp extends StatelessWidget {
  String mesaj_mrb = "merhaba..";

  @override
  Widget build(BuildContext context) {
    var ogrenciler = [
      "kemal mufit",
      " kerem Varış",
      "Berkay Bilgin",
      "Murat Kurboğan"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj_mrb),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: ogrenciler.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(ogrenciler[index]);
                  })),
          Center(
            child: RaisedButton(
              child: Text("sonucu gor"),
              onPressed: () {
                var mesaj = sinavHesapla(1);
                mesajGoster(context, mesaj);
              },
            ),
          ),
        ],
      ),
    );
  }

  String sinavHesapla(int puan) {
    String mesaj = "";
    if (puan >= 50) {
      mesaj = "geçti";
    } else if (puan >= 40) {
      mesaj = "bütünlemeye kaldı";
    } else {
      mesaj = "kaldı";
    }
    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("sınav sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
