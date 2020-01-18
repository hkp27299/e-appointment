import 'userscreen.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  
  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void validateAndSubmit() async {
    try {
      if (validateAndSave()) {
         await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.of(context).pushNamed(UserScreen.routename);                  
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    final signinbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.purpleAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          validateAndSubmit();
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
    final signupbutton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.purpleAccent,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.of(context).pushNamed(SignUp.routename);
        },
        child: Text(
          "Signup",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );

    
    return Scaffold(
      appBar: AppBar(
        title: Text('e-Appointment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 70),
            Image.asset('assets/images/login.png'),
            Form(
              key: formKey,
              child: Container(
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                child: Column(
                  children: <Widget>[
                    new TextFormField(
                      decoration: new InputDecoration(labelText: 'E-mail'),
                      validator: (value) =>
                          value.isEmpty ? 'E-mail can not be empty' : null,
                      onSaved: (value) => _email = value,
                    ),
                    new TextFormField(
                      decoration: new InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      validator: (value) =>
                          value.isEmpty ? 'Password can not be empty' : null,
                      onSaved: (value) => _password = value,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                child: signinbutton),
            
            Container(
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                child: signupbutton),
            
          ],
        ),
      ),
    );
  }
}
