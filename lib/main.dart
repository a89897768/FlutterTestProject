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
      routes: {
        ReturnValueRoute.ROUTE_NAME: (context) => ReturnValueRoute(
            tipText: ModalRoute.of(context).settings.arguments),
        NewRoute.ROUTE_NAME: (context) => NewRoute()
      },
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
                  String routeName = _counter % 2 == 0
                      ? ReturnValueRoute.ROUTE_NAME
                      : NewRoute.ROUTE_NAME;
                  Navigator.pushNamed(context, routeName, arguments: "提示文字");
                }),
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
}

class NewRoute extends StatelessWidget {
  static const String ROUTE_NAME = "NewRoute";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TestRoute"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("Pop Route"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class ReturnValueRoute extends StatelessWidget {
  static const String ROUTE_NAME = "ReturnValueRoute";
  final String tipText;

  ReturnValueRoute({this.tipText});

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
