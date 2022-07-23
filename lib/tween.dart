import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double end = 2 * pi;
  void _incrementCounter() {
    setState(() {
      _counter++;
      if (end == 2 * pi) {
        end = 0;
      } else {
        end = 2 * pi;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: TweenAnimationBuilder<double>(
            child: Container(
              width: 400,
              height: 400,
              color: Colors.cyan,
              child: Center(
                child: Text(
                  'Sajjad Ali',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            tween: Tween<double>(begin: 0, end: end),
            duration: const Duration(seconds: 1),
            builder: (context, value, child) => Transform.rotate(
                  angle: value,
                  child: child,
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
