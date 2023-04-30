import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'State management 1';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  int _counter = 0;

  void _increment() {
    setState(() => _counter++);
  }

  void _decrement() {
    setState(() => _counter--);
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("_DemoPageState");
    return Scaffold(
        appBar: AppBar(title: const Text('LayoutBuilder Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
            WidgetB(s:"$_counter"),
            const WidgetC(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    onPressed: _increment,
                    child: const Text("+1",
                        style: TextStyle(color: Colors.green, fontSize: 25))),
                Text("$_counter",
                    style: const TextStyle(
                      fontSize: 30,
                    )),
                TextButton(
                    onPressed: _decrement,
                    child: const Text("-1",
                        style: TextStyle(color: Colors.red, fontSize: 25)))
              ],
            )],
          ),
        ));
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({super.key, required this.s});

  final String s; 

  @override
  Widget build(BuildContext context) {
    debugPrint("WidgetB");
    return Text(s,
                    style: const TextStyle(
                      fontSize: 30,
                    ));
  }
}

class WidgetC extends StatelessWidget {
  const WidgetC({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("WidgetC");
    return const Text("pippo",
                    style: TextStyle(
                      fontSize: 30,
                    ));
  }
}
