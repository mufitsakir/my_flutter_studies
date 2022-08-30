
class StudentValidationMixin{

  String validateFirstName(String value){
    if(value.length<2)
      return "isim en az iki karakter olmaıdır";

    return "";
  }

  String validateLastName(String value){
    if(value.length<2)
      return "Soyad en az iki karakter olmaıdır";

    return "";
  }

  String validateGrade(String value){
    var grade = int.parse(value);
    if(grade<0 || grade>100)
      return "not 0-100 arasında olmalıdır";

    return "";
  }
}