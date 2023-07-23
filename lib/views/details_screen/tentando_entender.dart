import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyStatefulWidgetState();

  // note: updated as context.ancestorStateOfType is now deprecated
  static MyStatefulWidgetState? of(BuildContext context) =>
      context.findAncestorStateOfType<MyStatefulWidgetState>();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
  String _string = "Not set yet";

  set string(String value) => setState(() => _string = value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(_string),
        MyChildClass(callback: (val) => setState(() => _string = val))
      ],
    );
  }
}

typedef void StringCallback(String val);

class MyChildClass extends StatelessWidget {
  final StringCallback callback;

  MyChildClass({required this.callback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {
            callback("String from method 1");
          },
          child: Text("Method 1"),
        ),
        FloatingActionButton(
          onPressed: () {
            MyStatefulWidget.of(context)!.string = "String from method 2";
          },
          child: Text("Method 2"),
        )
      ],
    );
  }
}

void main() => runApp(
      MaterialApp(
        builder: (context, child) =>
            SafeArea(child: Material(color: Colors.white, child: child)),
        home: MyStatefulWidget(),
      ),
    );
