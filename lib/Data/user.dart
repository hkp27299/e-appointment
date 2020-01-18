
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<void> getData()async{
  String url = 'https://e-appointment-4f33a.firebaseio.com/user.json';
  final response = await http.get(url);
  print(json.decode(response.body));

}
