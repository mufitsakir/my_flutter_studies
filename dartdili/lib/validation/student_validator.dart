
class StudentValidationMixin{

  validateFirstName(String value) async {
  if(value.length<2){
    return "isim en az iki karakter olmaıdır";
  }
  }
}