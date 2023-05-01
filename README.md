# Flutter: Esempio di gestione dello stato con Consumer - 3
01.05.2023

Per evitare di dover incapsulare l'aggiornamento della UI in un diverso widget 
(che sarà l'unico a essere ricostruito), posso usare il widget Consumer,
che racchiude il Text che deve essere aggiornato, e che funziona allo stesso modo in cui,
nella versione precedente, funzionava il WidgetB.

In tal modo solo il Consumer verrà aggiornato al cambiamento dello stato.

Volendo anche il WidgetB può ancora visualizzare i cambiamenti dello stato usando Consumer.

Da notare (nella debug console) che non viene ricostruito ne il WidgetB ne il WidgetC,
Ma solo i widget Text.