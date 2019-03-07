import 'dart:async';

class Validators{
  final validatorEmail = StreamTransformer<String,String>.fromHandlers(handleData: (email, sink){
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if(regex.hasMatch(email)){
      sink.add(email);
    } else if (email == ''){
      sink.addError('');
    } 
    else {
      sink.addError('Invalid email');
    }
  });

  final validatorPassword =StreamTransformer<String, String>.fromHandlers(handleData: (password, sink){
    if(password.length > 3) {
      sink.add(password);
    } else {
      sink.addError('Invalid password');
    }
  });
}