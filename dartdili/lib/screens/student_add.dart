import 'package:flutter/material.dart';
import 'package:dartdili/models/student.dart';
import 'package:dartdili/validation/student_validator.dart';

class StudentAdd extends StatefulWidget {
  late List<Student> students;
  StudentAdd(List<Student> student) {
    this.students = students;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State with StudentValidationMixin  {
  late List<Student> students;
  var student =  Student.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StudentAddState(List<Student> students){
    this.students = students;
  }
  // final _formKey = GlobalKey<FormState>();

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
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),
        ),
      )
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrencinin ismi" ,hintText: "Müfit"),
      validator: (value){
        validateFirstName(value!);
      },
      onSaved: (value){
        student.firstName = value!;
      },
    );
  }
  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci Soyadı",hintText: "SAKIR"),
      validator: (value){
        validateLastName(value!);

      },
      onSaved: (value){
        student.lastName = value!;
      },
    );
  }
  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı not" ,hintText: "65"),
      validator: (value){
        validateFirstName(value!);
      },
      onSaved: (value){
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState!.validate()){
          formKey.currentState!.save();
          students.add(student);
          saveStudent();
        }
      },
    );


  }

  void saveStudent() {

    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }
}
