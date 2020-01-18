import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserData {
  String fname;
  String lname;
  String contactno;
  String address;
  String email;


  UserData({
    @required this.fname,
    @required this.lname,
    @required this.contactno,
    @required this.address,
    @required this.email,
  });
}
Future<void> getData()async{
  String url = 'https://e-appointment-4f33a.firebaseio.com/user.json';
  final response = await http.get(url);
  print(json.decode(response.body));

}
