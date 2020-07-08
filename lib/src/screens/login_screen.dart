import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final fornKey=GlobalKey<FormState>();
  String email;
  String password;
  Widget build(context){
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: fornKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 20),),
            buttonField(),
          ],
        ),
      ),
    );
  }
  Widget emailField(){
      return TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email Address',
          hintText: 'you@email.com'
        ),
        validator: validateEmail,
        onSaved: (String value){
          email=value;
        },
      );
  }
  Widget passwordField(){
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Password',
      ),
      onSaved: (String value){
        password=value;
      },
      validator: valaidatePassword,
    );
  }
  Widget buttonField(){
    return  RaisedButton(
      color: Colors.blue,
      child: Text("Submit"),
      onPressed: (){
        if(fornKey.currentState.validate()){
          fornKey.currentState.save();
          print(email+" "+password);
        }
      },
    );
  }
}