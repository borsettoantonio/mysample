import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ParentWidget(title: 'Flutter Demo Home Page'),
    );
  }
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key, required this.title});
  final String title;

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  int _counter = 0;

  @override
  void didChangeDependencies() {
    print('didChangeDependencies() in ParentWidget');
    super.didChangeDependencies();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _niente() {
    setState(() {
      _counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Life Cycle'),
        ),
        body: Provider.value(
          value: _counter,
          //updateShouldNotify: (oldValue, newValue) => oldValue!=newValue && newValue.isEven,
          updateShouldNotify: (oldValue, newValue) => true,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Press Fab button to increase counter:',
                ),
                ChildWidget()
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 100,
            ),
            FloatingActionButton(
              onPressed: _niente,
              tooltip: 'Increment',
              child: const Text('Niente'),
            ),
          ],
        ));
  }
}

class ChildWidget extends StatefulWidget {
  const ChildWidget({super.key});

  @override
  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  int _counter = 0;
  @override
  void initState() {
    print('initState(), counter = $_counter');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    //_counter = Provider.of<int>(context, listen: true);
    print('didChangeDependencies(), counter = $_counter');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('build(), counter = $_counter');
    //return Text(
    //  '$_counter',);
      return Text(Provider.of<int>(context, listen: true).toString());
    
  }
}
