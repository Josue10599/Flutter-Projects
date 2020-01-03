import 'package:build_new_floating_button/src/page/count_click_page.dart';
import 'package:flutter/material.dart';

class CounterClickApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.orange,
        accentColor: Colors.orangeAccent,
        primarySwatch: Colors.deepOrange,
      ),
      home: CounterClickPage(),
    );
  }
}
