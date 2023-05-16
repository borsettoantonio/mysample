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
  late final StreamController<int> controller;

  bool end = false;
  bool on = true;

  int _computationCount = 0;

  void parti() async {
    while (!end) {
      await Future.delayed(const Duration(seconds: 1), () {
        if (on) controller.add(++_computationCount);
      });
    }
  }

  @override
  void initState() {
    controller = StreamController<int>(
      onListen: parti,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: 0,
      stream: controller.stream,
      builder: (context, AsyncSnapshot<int> snapshot) {
        var bgColor =
            Colors.primaries[Random().nextInt(Colors.primaries.length)];
        return Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Flutter Stream.periodic Demo'),
            backgroundColor: bgColor,
          ),
          body: Center(
            child: Text(
              snapshot.data.toString(),
              style: const TextStyle(fontSize: 150, color: Colors.white),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            FloatingActionButton(
              backgroundColor: bgColor,
              child: const Icon(
                Icons.stop,
                size: 30,
              ),
              onPressed: () => on = false,
            ),
            const SizedBox(width:20),
            FloatingActionButton(
              backgroundColor: bgColor,
              child: const Icon(
                Icons.start,
                size: 30,
              ),
              onPressed: () => on = true,
            ),
            const SizedBox(width:20),
            FloatingActionButton(
              backgroundColor: bgColor,
              child: const Icon(
                Icons.fiber_manual_record_outlined ,
                size: 30,
              ),
              onPressed: () => end = true,
            ),
          ]),
        );
      },
    );
  }
}
