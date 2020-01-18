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

  void clearData() {
    fullname.text = "";
    contactno.text = "";
    bloodgroup.text = "";
    bloodloss.text = "";
    injuredbodyparts.text = "";
    discription.text = "";
    setState(() {
      yes = false;
      no = false;
      _selected = null;
    });
  }

  List<String> genders = ['Male', 'Female', 'Other'];
  List<String> ot = ['Yes', 'No'];
  String _selected;
  bool yes = false;
  bool no = false;
  void otst() {
    if (yes) {
      otstatus.text = 'Yes';
    } else {
      otstatus.text = 'No';
    }
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
                  Row(
                    children: <Widget>[
                      Text(
                        'Gender',
                        style:
                            TextStyle(fontSize: 16.5, color: Colors.grey[600]),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      DropdownButton(
                        hint: Text('Select'), 
                        value: _selected,
                        onChanged: (newValue) {
                          gender.text = newValue;
                          setState(() {
                            _selected = newValue;
                          });
                        },
                        items: genders.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                      ),
                    ],
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
                  Row(
                    children: <Widget>[
                      Text(
                        'Want to ready OT?',
                        style:
                            TextStyle(fontSize: 16.5, color: Colors.grey[600]),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      /* DropdownButton(
                        hint: Text(
                            'Select'), // Not necessary for Option 1
                        value: _selected1,
                        onChanged: (newValue) {
                          otstatus.text = newValue;
                          setState(() {
                            _selected1 = newValue;
                          });
                        },
                        items: ot.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location),
                            value: location,
                          );
                        }).toList(),
                      ), */
                      Text("Yes"),
                      Checkbox(
                        value: yes,
                        onChanged: (bool value) {
                          setState(() {
                            yes = value;
                            otst();
                          });
                        },
                      ),
                      Text("No"),
                      Checkbox(
                        value: no,
                        onChanged: (bool value) {
                          setState(() {
                            no = value;
                            otst();
                          });
                        },
                      ),
                    ],
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
                        clearData();
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
