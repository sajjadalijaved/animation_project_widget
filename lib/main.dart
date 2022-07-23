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
  var isOpaque = 0.0;
  double width = 200;
  double height = 200;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (isOpaque == 0.0) {
        isOpaque = 1.0;
        width = 400;
        height = 400;
      } else {
        isOpaque = 0.0;
        width = 200;
        height = 200;
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
                curve: Curves.easeInExpo,
                width: width,
                height: height,
                color: Colors.amber,
                child: Center(
                  child: Text(
                    'Sajjad Ali',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                duration: const Duration(seconds: 1)),
            AnimatedOpacity(
              opacity: isOpaque,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOutBack,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
