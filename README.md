# Esempio del metodo didChangeDependencies()
# e della proprietà updateShouldNotify.
11.05.2023

Il metodo didChangeDependencies() viene chiamato quando 
vengono aggiornate le dipendenze del widget.

Queste si hanno quando si usa un InheritedWidget. Anche 
attraverso un provider.

Il parametro updateShouldNotify del provider serve a registrare una funzione 
che viene richiamata per decidere se notificare i listener dell'aggiornamento dello stato.

Nell'esempio c'è un ParentWidget che al suo interno contiene un Provider di un valore intero.
Il Provider ha come child un ChildWidget il cui metodo didChangeDependencies()
viene richiamato quando viene creato e:

- se updateShouldNotify non è specificato il metodo, ChildWidget()
viene chiamato quando lo stato varia;

- se abbiamo: updateShouldNotify: (oldValue, newValue) => true,
didChangeDependencies viene chiamato sempre anche se il metodo setState 
accede ma non modifica lo stato;

- oppure si può mettere una condizione per la chaimata:
updateShouldNotify: (oldValue, newValue) => oldValue!=newValue && newValue.isEven,

Nel ChildWidget nel metodo didChangeDependencies viene fatto l'accesso al
provider. In tal caso alla modifica dei dati del provider il metodo è richiamato.

Se nel metodo build si usa il Provider:
Text(Provider.of<int>(context, listen: true).toString());
allora didChangeDependencies viene chiamato, anche se non serve.

Se invece nel metodo build si usa un Consumer, allora didChangeDependencies
non viene chiamato, perchè è il didChangeDependencies del Consumer 
ad essere chiamato, e ChildWidget non ha una dipendenza dal provider,
che è definita dentro al Consumer.

