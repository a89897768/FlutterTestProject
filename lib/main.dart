import 'package:flutter/material.dart';

import 'DJIcon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String ICON_PATH = "image/icon_28_g_01.png";
  static const String ICON_PATH_HOLD = "image/icon_28_g_01_hold.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: DJIcon(ICON_PATH, ICON_PATH_HOLD, null),
          title: Text(widget.title)),
      body: Center(),
    );
  }
}
