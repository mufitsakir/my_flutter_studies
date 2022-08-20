import 'package:dartdili/screens/student_add.dart';
import 'package:flutter/material.dart';
import 'package:dartdili/models/student.dart';

void main() {
  runApp(MaterialApp(home: Myapp()));
}

class Myapp extends StatefulWidget {
  @override
  // State<Myapp> createState() return _MyappState();
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  String mesaj_mrb = "Öğrenci Takip Sistemi";

  Student selectedStudent = Student.WithId(0,"","",0);

  // var students = new List <Student>(); --> hatali kullanim tipi
   List<Student> students = [
     Student.WithId(1,"kemal", "sakir", 25),
     Student.WithId(2,"Kerem", "Varış",65),
     Student.WithId(3,"Halil", "Duymaz", 45)];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj_mrb),
      ),
      body: buildBody(context),
    );
  }



  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem sonucu"),
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
                    subtitle: Text("Sınavdan aldiği not: " + students[index].grade.toString() + " [" + students[index].getStatus + "]"),
                    trailing: buildStatusIcon(students[index].grade),
                     onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                      print(selectedStudent.firstName);

                    }

                  );
                })),
        Text("Seçili öğrenci :" + selectedStudent.firstName),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child:    RaisedButton(
                color: Colors.greenAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      SizedBox(width: 3.0,),
                      Text("Yeni Öğrenci!!!"),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd()));
                  },
                ),

            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child:    RaisedButton(
                color: Colors.black26,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(width: 3.0,),
                    Text("Güncelle!!!"),
                  ],
                ),
                onPressed: () {
                  var mesaj = "Güncellendi :";
                  mesajGoster(context, mesaj);
                },
              ),

            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child:    RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(width: 5.0,),
                    Text("Sil!!!"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });

                  var mesaj = "Silindi :" + selectedStudent.firstName + selectedStudent.lastName;
                  mesajGoster(context, mesaj);
                },
              ),

            )
          ],
        )


      
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
