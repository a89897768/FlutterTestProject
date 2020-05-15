import 'package:flutter/material.dart';

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
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                _openTestRoute();
                print("測試Log：繼續執行");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _openTestRoute() async {
    var returnValue =
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TestRoute(tipText: "提示文字");
    }));
    print("測試Log：" + returnValue);
  }
}

class TestRoute extends StatelessWidget {
  final String tipText;

  TestRoute({this.tipText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        textColor: Colors.red,
        onPressed: () => Navigator.pop(context, "返回文字"),
        child: Text(tipText),
      ),
    );
  }
}