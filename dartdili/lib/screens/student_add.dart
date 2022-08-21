import 'package:flutter/material.dart';
import 'package:dartdili/models/student.dart';
import 'package:dartdili/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State with StudentValidationMixin  {
  var student =  Student.withoutInfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Yeni Öğrenci Ekle"),
      ),
      body:Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: "Öğrenci Adı",hintText: "Müfit"),
                validator: validateFirstName,
                onSaved: (value){
                   student.firstName = value!;
                },

              )
            ],
          ),
        ),
      )
    );
  }
}
