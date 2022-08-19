import 'package:flutter/material.dart';
import 'package:dartdili/models/student.dart';

void main() {
  runApp(MaterialApp(home: Myapp()));
}

class Myapp extends StatelessWidget {
  String mesaj_mrb = "merhaba..";
  // var students = new List <Student>(); --> hatali kullanim tipi

  //var students = new List <Student>.empty();
  // var students = <Student>[];
  List<Student> students = [Student("kemal", "sakir", 25),Student("Kerem", "Varış",65),Student("Halil", "Duymaz", 45)];


  var ogrenciler = [
    "kemal mufit",
    " kerem Varış",
    "Berkay Bilgin",
    "Murat Kurboğan"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj_mrb),
      ),
      body: buildBody(context),
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

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2018/06/27/07/45/student-3500990_960_720.jpg"),
                    ),
                    title: Text(students[index].firstName + "" + students[index].lastName),
                    subtitle: Text("Sınavdan aldiği not: " + students[index].grade.toString()),
                    trailing: buildStatusIcon(students[index].grade),
                    // onTap: (){,
                  );
                })),
        Center(
          child: RaisedButton(
            child: Text("sonucu gor!!!"),
            onPressed: () {
              var mesaj = sinavHesapla(1);
              mesajGoster(context, mesaj);
            },
          ),
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {

    if (grade >= 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }


  }
}
