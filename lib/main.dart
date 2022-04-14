import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

enum Answers { YES, NO, MAYBE }

class _State extends State<MyApp> {
  String _value = '';
  void setvalue(String value) => setState(() {
        _value = value;
      });

  Future _askuser() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Do you like Flutter?'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("Yes!!"),
                onPressed: () {
                  Navigator.pop(context, Answers.YES);
                },
              ),
              SimpleDialogOption(
                child: Text('No!!'),
                onPressed: () {
                  Navigator.pop(context, Answers.NO);
                },
              ),
              SimpleDialogOption(
                child: Text('May Be..'),
                onPressed: () {
                  Navigator.pop(context, Answers.MAYBE);
                },
              ),
            ],
          );
        })) {
      case Answers.YES:
        setvalue('Yes');
        break;
      case Answers.NO:
        setvalue('No');
        break;
      case Answers.MAYBE:
        setvalue('Maybe');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldstate,
      appBar: AppBar(
        title: const Text('Simple Dialog'),
      ),
      body: Container(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(_value),
                ElevatedButton(
                    onPressed: (() => _askuser()), child: const Text('Vote')),
              ],
            ),
          )),
    );
  }
}
