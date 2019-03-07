import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators{

  final _emailController = new BehaviorSubject<String>();
  final _passwordController = new BehaviorSubject<String>();

  String user_email = "condaveat@gmail.com";
  String user_password = "12345";
  
  //Add data to Stream
  Function(String) get email => _emailController.sink.add;  
  Function(String) get password => _passwordController.sink.add;

  //retreive data from Stream
  Stream<String> get emailStream => _emailController.stream.transform(validatorEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validatorPassword);

  Stream<bool> get submitValidate => Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);

  submit() {
    print(_emailController.value);
    print(_passwordController.value);
    if ( _emailController.value == user_email && _passwordController.value ==user_password ) print('Correct');
    else print('Invalid user and password');
  }

  dispose(){
    _emailController.close();
    _passwordController.close();
  }
  
}
