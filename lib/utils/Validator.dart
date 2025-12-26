import'dart:core';
class Validator{
static String? inputvalidate(String str,String type){
  if(str.isEmpty || str==' '){
    return "Please enter $type";
  }
  else  if(str.length<=1){
    return "Please enter valid $type";
  }
  else{
    return null;
  }
}
}