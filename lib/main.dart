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
        ReturnValueRoute.ROUTE_NAME: (BuildContext context) =>
            ReturnValueRoute(value: ModalRoute.of(context).settings.arguments),
      },
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == NewRoute.ROUTE_NAME) {
          print("測試Log_透過onGenerateRoute生成");
          return MaterialPageRoute(
              builder: (BuildContext context) => NewRoute());
        }
        return null;
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
            FlatButton(
                child: Text("Navigator範例：Navigator.push"),
                textColor: Colors.blue,
                onPressed: () {
                  //開啟NewRoute
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewRoute()));
                }),
            FlatButton(
                child: Text("Route傳值範例"),
                textColor: Colors.blue,
                onPressed: () {
                  _openReturnValueRoute();
                  print("測試Log_繼續執行");
                }),
            FlatButton(
                child: Text("Route命名範例"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, ReturnValueRoute.ROUTE_NAME,
                      arguments: "arguments");
                }),
            FlatButton(
                child: Text("onGenerateRoute範例"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.pushNamed(context, NewRoute.ROUTE_NAME);
                }),
          ],
        ),
      ),
    );
  }

  void _openReturnValueRoute() async {
    var returnValue = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ReturnValueRoute(value: "建構時傳的值")));
    print("測試Log_" + returnValue);
  }
}

class NewRoute extends StatelessWidget {
  static const String ROUTE_NAME = "NewRoute";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewRoute"),
      ),
      body: Center(
        child: FlatButton(
          child: Text("Navigator範例：Navigator.pop"),
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

  final String value;

  ReturnValueRoute({this.value});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(value, style: TextStyle(color: Colors.red)),
            FlatButton(
              textColor: Colors.black,
              onPressed: () => Navigator.pop(context, "退出時回傳的值"),
              child: Text("Navigator.pop(context, 退出時回傳的值)"),
            )
          ]),
    );
  }
}
