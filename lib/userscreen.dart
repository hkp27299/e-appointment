import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserScreen extends StatefulWidget {
  static const routename = '/userscreen';

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String validator(String value) {
    if (value.isEmpty) {
      return "This field can not be empty";
    } else {
      return null;
    }
  }

  void addData() {
    String url = "https://e-appointment-4f33a.firebaseio.com/patient.json";
    http.post(url,
        body: json.encode({
          'fullname': fullname.text,
          'gender': gender.text,
          'contactno': contactno.text,
          'bloodloss': bloodloss.text,
          'bloodgroup': bloodgroup.text,
          'injuredbodyparts': injuredbodyparts.text,
          'discription': discription.text,
          'otstatus': otstatus.text,
        }));
  }
  void clearData(){

  }

  TextEditingController fullname;
  TextEditingController gender;
  TextEditingController contactno;
  TextEditingController bloodloss;
  TextEditingController injuredbodyparts;
  TextEditingController discription;
  TextEditingController otstatus;
  TextEditingController bloodgroup;
  initState() {
    fullname = new TextEditingController();
    gender = new TextEditingController();
    contactno = new TextEditingController();
    bloodloss = new TextEditingController();
    injuredbodyparts = new TextEditingController();
    otstatus = new TextEditingController();
    discription = new TextEditingController();
    bloodgroup = new TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _regkey = new GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Form'),
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
                      labelText: 'Full-name',
                    ),
                    controller: fullname,
                    keyboardType: TextInputType.emailAddress,
                    validator: validator,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Gender',
                    ),
                    controller: gender,
                    keyboardType: TextInputType.emailAddress,
                    validator: validator,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Contact-no',
                    ),
                    controller: contactno,
                    keyboardType: TextInputType.emailAddress,
                    validator: validator,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Blood-Loss in %',
                    ),
                    controller: bloodloss,
                    keyboardType: TextInputType.emailAddress,
                    validator: validator,
                  ),
                   TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Blood-Group',
                    ),
                    controller: bloodgroup,
                    keyboardType: TextInputType.emailAddress,
                    validator: validator,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Injured-Bodyparts',
                    ),
                    controller: injuredbodyparts,
                    keyboardType: TextInputType.emailAddress,
                    validator: validator,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Want to Ready OT?',
                    ),
                    controller: otstatus,
                    keyboardType: TextInputType.emailAddress,
                    validator: validator,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Discription Of Injury',
                    ),
                    controller: discription,
                    keyboardType: TextInputType.emailAddress,
                    validator: validator,
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    color: Colors.purpleAccent,
                    child: Text('Submit'),
                    onPressed: () {
                      if (_regkey.currentState.validate()) {
                        _regkey.currentState.save();
                        addData();
                      

                      }
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }
}
