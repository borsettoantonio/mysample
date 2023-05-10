import 'first_model_provider.dart';
import 'second_model_provider.dart';
import 'counting_the_number.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'my_home_page.dart';
//import 'views/my_app.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CountingTheNumber(),
      ),
      ChangeNotifierProvider(
        create: (context) => FirstModelProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SecondModelProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}
