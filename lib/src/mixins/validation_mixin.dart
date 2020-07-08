class ValidationMixin{
  String validateEmail(String value){
    if(!value.contains('@'))
      return 'Please enter a valid email';
    return null;
  }
  String valaidatePassword(String value){
    if(value.length>=4)
      return null;
    return "Not a valid Password";
  }
}