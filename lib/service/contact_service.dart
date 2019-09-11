import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/contact.dart';

class ContactService {
  static String _url = "https://jsonplaceholder.typicode.com/users";

  static Future browser() async {
    http.Response response = await http.get(_url);
    //print(response.body);

    await Future.delayed(Duration(seconds: 2));
    String content = response.body;
    List collection = json.decode(content);
    List<Contact> _contacts =
        collection.map((json) => Contact.fromJson(json)).toList();
    return _contacts;
  }
}
