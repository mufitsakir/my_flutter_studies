class Student{
  String firstName = "";  //Late ne demek
  String lastName = "";
  int grade = 0;
  String _status = "";
  late int id;

  Student.WithId(int id ,String firstName, String lastName,int grade){
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;

  }

  Student(String firstName, String lastName,int grade){

    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;

  }

  Student.withoutInfo(){

  }



  String get getFirstName{
    return "OGR - " + this.firstName;
  }
  void set setFirstName(String value){
    this.firstName = value;
  }
  String get getStatus{
  String message = "";
  if (this.grade >= 50) {
  message = "geçti";
  } else if (this.grade >= 40) {
  message = "bütünlemeye kaldı";
  } else {
  message = "kaldı";
  }
  return message;
}
}