import 'package:flutter/material.dart';
import 'package:flutter_bloc_streambuilder/contact_screen.dart';

void main() => runApp(MaterialApp(
      title: 'StreamBuilder & BLOC',
      home: MyHomePage(),
    ));

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContactsScreen();
  }
}
