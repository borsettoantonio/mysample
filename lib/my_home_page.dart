import 'first_model_provider.dart';
import 'second_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counting_the_number.dart';

class MyHomePage extends StatelessWidget {
  final String title = 'Using Provider Examples';

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// MyHomePage is rebuilt when counter changes
    final counter = Provider.of<CountingTheNumber>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 25.0),
              textAlign: TextAlign.center,
            ),

            /// consumer or selector
            Text(
              '${counter.value}',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      padding: const EdgeInsets.all(30)),
                  onPressed: () => counter.incrementTheValue(),
                  child: const Text(
                    'Increase',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  onPressed: () => counter.decreaseValue(),
                  child: const Text(
                    'Decrease',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.red,
                  child: ElevatedButton(
                    child: const Text(
                      'Press me!',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      Provider.of<FirstModelProvider>(context, listen: false)
                          .supplyFirstData();
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.white30,
                  child: Consumer<FirstModelProvider>(
                    builder: (context, firstModelProvider, child) => Text(
                      firstModelProvider.someDate,
                      style: const TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.red[200],
                  child: ElevatedButton(
                    child: const Text(
                      'Reset',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      Provider.of<FirstModelProvider>(context, listen: false)
                          .clearData();
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.white30,
                  child: Consumer<SecondModelProvider>(
                    builder: (context, secondModel, child) => Text(
                      secondModel.name,
                      style: const TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.red[200],
                  child: 
                     ElevatedButton(
                      child: const Text(
                        'Get First Name',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {
                        Provider.of<SecondModelProvider>(context, listen: false)
                        .getFirstName();
                      },
                    ),
                  ),
         
              ],
            ),
          ],
        ),
      ),
      /// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
