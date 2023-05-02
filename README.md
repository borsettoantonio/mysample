# ChangeNotifierProxyProvider
02.05.2023

Esempio di uso di ChangeNotifierProxyProvider.

Da notare che se in ChangeNotifierProxyProvider si utilizza:

update: (BuildContext context, Person person, Job? job) => Job(person, career: 'Vet'),

in cui si ricrea un nuovo Job, non c'è bisogno di chiamare notifyListeners() in Job,
e le chiamate a context.select e context.watch su Job vengono comunque aggiornate.

Se invece si utilizza:

update: (BuildContext context, Person person, Job? job) => job!..notifica(),

in cui si modifica il Job esistente, occorre chiamare un metodo che contenga
notifyListeners().