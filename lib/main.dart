import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterWidget(),
      //注册路由表
      routes: {
        "page1": (context) => Page1(),
        "page2": (context) => Echo(text: '...')
      } ,
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Page1'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('This is page11.')
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          print('Click page1 button.');
          Navigator.pushNamed(context, "page2");
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add)
      )
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Page2'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('This is page2.')
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          print('Click page2 button.');
          Navigator.pushNamed(context, "page1");
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add)
      )
    );
  }
}

class Echo extends StatelessWidget {
  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor: Colors.grey
  }): super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key key,
    this.initValue: 0
  });

  final int initValue;

  @override
  State<StatefulWidget> createState() => new _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter;
  // flutter: initState...
  // flutter: didChangeDependencies....
  // flutter: builder...
  // flutter: reassemble....
  // flutter: didUpdateWidget....
  // flutter: builder...

  @override
  void initState() {
    super.initState();

    _counter = widget.initValue;
    print('initState...');
  }

  @override
  Widget build(BuildContext context) {
    print('builder...');
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('$_counter'),
          onPressed: () => setState(() => ++_counter),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget....");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate....");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispost....");
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble....');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies....');
  }
}