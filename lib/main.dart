import 'package:flutter/material.dart';
import 'package:mysample/counter_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'State management 2';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => CounterModel(),
        child: const DemoPage(),
      ),
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("_DemoPageState");

    final counter = Provider.of<CounterModel>(context);
    return Scaffold(
        appBar: AppBar(title: const Text('LayoutBuilder Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WidgetB(s: "${counter.currentCount}"),
              WidgetC(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () => counter.increment(),
                      child: const Text("+1",
                          style: TextStyle(color: Colors.green, fontSize: 25))),
                  Text("${counter.currentCount}",
                      style: TextStyle(color: Colors.amber, fontSize: 25)),
                  TextButton(
                      onPressed: counter.decrement,
                      child: const Text("-1",
                          style: TextStyle(color: Colors.red, fontSize: 25)))
                ],
              )
            ],
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
