import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Person with ChangeNotifier {
  Person({required this.name, required this.age});

  String name;
  int age;

  void increaseAge() {
    age++;
    notifyListeners();
  }

  void changeName() {
    name = "Gary";
    notifyListeners();
  }
}

class Countdown {
  static Stream<String> start() async* {
    var i = 10;
    while (i > 0) {
      await Future.delayed(Duration(seconds: 1), () {
        i--;
      });
      yield i.toString();
    }

    yield "bLAsT oFf !!!";
  }
}

void main() {
  runApp(
    MultiProvider(
      providers: [
        StreamProvider<String>(
          create: (_) => Countdown.start(),
          initialData: "Begin countdown...",
          catchError: (_, error) => error.toString(),
        ),
        ChangeNotifierProvider<Person>(
          create: (_) => Person(name: 'Yohan', age: 25),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Context extensions"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: <Widget>[
              //Text("Name: ${Provider.of<Person>(context).name}"),
              //Text("context.select: ${context.select((Person p) => p.age)}"),
              const WidgetB(),
              const WidgetA(),
              Text("context.watch: ${context.watch<String>()}"),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<Person>().increaseAge();
        },
      ),
    );
  }
}

class WidgetA extends StatelessWidget {
  const WidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("WidgetA");
    final name = context.select((Person p) => p.age);
    return Text(name.toString());
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("WidgetB");
    //final name = context.select((Person p) => p.name);
    //return Text(name);

    return Text("Name: ${Provider.of<Person>(context).name}");
  }
}
