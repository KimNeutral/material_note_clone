import 'package:flutter/material.dart';
import 'package:material_note/page/main_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Material Memo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          title: TextStyle(fontFamily: 'Consolas', color: Colors.black, fontWeight: FontWeight.bold),
          caption: TextStyle(fontFamily: 'Consolas', color: Colors.black),
          body1: TextStyle(fontFamily: 'Consolas', color: Colors.black, fontSize: 17.0),
          body2: TextStyle(fontFamily: 'Consolas', color: Colors.black, fontSize: 15.0),
          display1: TextStyle(fontFamily: 'Consolas', color: Colors.black),
          display2: TextStyle(fontFamily: 'Consolas', color: Colors.black),
          display3: TextStyle(fontFamily: 'Consolas', color: Colors.black),
          display4: TextStyle(fontFamily: 'Consolas', color: Colors.black),
          headline: TextStyle(fontFamily: 'Consolas', color: Colors.black),
          subhead: TextStyle(fontFamily: 'Consolas', color: Colors.black),
          button: TextStyle(fontFamily: 'Consolas', color: Colors.black)
        )
      ),
      home: new MainPage(title: 'Notes'),
    );
  }
}