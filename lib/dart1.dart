void calculate() async {
  Future<int> one = exampleOne();
  Future<String> two = exampleTwo();
  Future<double> three = exampleThree();
  try {
    List<dynamic> res = await Future.wait<dynamic>([one, two, three]);
    stampa(res);
  } catch (e) {
    print('errore');
  }
  ;
}

Future<int> exampleOne() async {
  print('inizio exampleOne');
  await Future.delayed(Duration(seconds: 3));
  print('fine exampleOne');
  return Future<int>.value(1);
}

Future<String> exampleTwo() async {
  print('inizio exampleTwo');
  final future = Future<String>.delayed(const Duration(seconds: 3), () {
    print('fine exampleTwo');
    return 'due';
  });
  return future;
}

Future<double> exampleThree() {
  // se si usa questa istruzione, viene stampato prima 'Called ...' e poi 'fatto'
  final future = Future<void>.sync(() => print("Called immediately"));

  // se si usa questa istruzione, viene stampato prima 'fatto' e poi 'Called ...'
  //Future(() => print("Called immediately"));
  print("fatto");
  return Future<double>.value(3.3);
}

void stampa(List<dynamic> res) {
  for (var x in res) print(x);
}
