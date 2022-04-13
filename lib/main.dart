import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _minHeight = 8;
  int _maxHeight = 200;
  double _barHeight1 = 8;
  double _barHeight2 = 8;
  double _barHeight3 = 8;
  double _barHeight4 = 8;
  double _barHeight5 = 8;

  final _random = Random();
  Timer? timer;
  bool _isStarted = false;

  void startTimer() {
    print('start timer');
    if (!_isStarted) {
      _isStarted = true;
      timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
        print('inside timer');
        setState(() {
          _barHeight1 = next(_minHeight, _maxHeight).toDouble();
          _barHeight2 = next(_minHeight, _maxHeight).toDouble();
          _barHeight3 = next(_minHeight, _maxHeight).toDouble();
          _barHeight4 = next(_minHeight, _maxHeight).toDouble();
          _barHeight5 = next(_minHeight, _maxHeight).toDouble();
        });
      });
    }
  }

  void stopTimer() {
    print('stop timer');
    if (_isStarted) {
      timer?.cancel();
    }
  }

  int next(int min, int max) => min + _random.nextInt(max - min);

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(left: 16, right: 16),
          width: double.infinity,
          height: 300,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedContainer(
                width: 50,
                height: _barHeight1,
                color: Colors.lightGreen,
                duration: const Duration(milliseconds: 500),
              ),
              AnimatedContainer(
                width: 50,
                height: _barHeight2,
                color: Colors.pinkAccent,
                duration: const Duration(milliseconds: 500),
              ),
              AnimatedContainer(
                width: 50,
                height: _barHeight3,
                color: Colors.lightBlue,
                duration: const Duration(milliseconds: 500),
              ),
              AnimatedContainer(
                width: 50,
                height: _barHeight4,
                color: Colors.orangeAccent,
                duration: const Duration(milliseconds: 500),
              ),
              AnimatedContainer(
                width: 50,
                height: _barHeight5,
                color: Colors.cyanAccent,
                duration: const Duration(milliseconds: 500),
              ),
            ],
          ),
        )
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: startTimer,
            child: const Icon(
              Icons.play_arrow
            ),
          ),
          FloatingActionButton(
            onPressed: stopTimer,
            child: const Icon(
                Icons.stop
            ),
          ),
        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
