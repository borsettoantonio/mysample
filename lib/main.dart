import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Stream _myStream =
      Stream.periodic(const Duration(seconds: 1), (int count) {
    return count;
  });
  late StreamSubscription _sub;
  bool end = false;

  int _computationCount = 0;

  Color _bgColor = Colors.blueGrey;

  @override
  void initState() {
    /*
    _sub = _myStream.listen((event) {
      setState(() {
        _computationCount = event;
        _bgColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      });
    });
    */
    // oppure ...
    f1();
    super.initState();
  }

  void f1() async {
    await for (var val in _myStream) {
      if(end) break;
      setState(() {
        _computationCount = val;
        _bgColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      });
    }
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Flutter Stream.periodic Demo'),
        backgroundColor: Colors.white12,
      ),
      body: Center(
        child: Text(
          _computationCount.toString(),
          style: const TextStyle(fontSize: 150, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(
          Icons.stop,
          size: 30,
        ),
        //onPressed: () => _sub.cancel(),
        onPressed: () => end=true,
      ),
    );
  }
}
