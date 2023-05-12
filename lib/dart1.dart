void calculate() {
  Future<int> one = exampleOne();
  Future<int> two = exampleTwo();
  Future<int> three = exampleThree();
  Future<List<int>> res = Future.wait<int>([one, two, three]);
  res.then((re) => stampa(re)).catchError((_) => print('errore'));
}

Future<int> exampleOne() async {
  print('inizio exampleOne');
  await Future.delayed(Duration(seconds: 3));
  print('fine exampleOne');
  return Future<int>.value(1);
}

Future<int> exampleTwo() async {
  print('inizio exampleTwo');
  final future = Future<int>.delayed(const Duration(seconds: 3), () {
    print('fine exampleTwo');
    return 2;
  });
  return future;
}

Future<int> exampleThree() {
  // se si usa questa istruzione, viene stampato prima 'Called ...' e poi 'fatto'
  final future = Future<void>.sync(() => print("Called immediately"));

  // se si usa questa istruzione, viene stampato prima 'fatto' e poi 'Called ...'
  //Future(() => print("Called immediately"));
  print("fatto");
  return Future<int>.value(3);
}

void stampa(List<int> res) {
  for (var x in res) print(x);
}
