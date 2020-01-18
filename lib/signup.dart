import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUp extends StatefulWidget {
  static const routename = '/signup';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _regkey = new GlobalKey<FormState>();
  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length <= 7) {
      return 'Password must be 8 characters';
    } else {
      return null;
    }
  }
  String validator(String value){
    if(value.isEmpty){
      return "This field can not be empty";
    }
    else{
      return null;
    }
  }
 


  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;
 
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup Here'),
      ),
      body: SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _regkey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email*',
                  ),
                  controller: emailInputController,
                  keyboardType: TextInputType.emailAddress,
                  validator: emailValidator,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password*',
                  ),
                  controller: pwdInputController,
                  obscureText: true,
                  validator: pwdValidator,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Confirm Password*',
                  ),
                  controller: confirmPwdInputController,
                  obscureText: true,
                  validator: pwdValidator,
                ),
                
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  color: Colors.purpleAccent,
                  child: Text('Register'),
                  onPressed: () {
                    if (_regkey.currentState.validate()) {
                      _regkey.currentState.save();
                      if (pwdInputController.text ==
                          confirmPwdInputController.text) {
                            
                        FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: emailInputController.text,
                            password: pwdInputController.text);
                        Navigator.of(context).pop();
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text("The passwords do not match"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("Close"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              );
                            });
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Already have an account?"),
                FlatButton(
                    child: Text("Login here!"),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
