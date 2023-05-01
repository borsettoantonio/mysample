# Flutter: Esempio di gestione dello stato con provider - 2
01.05.2023

Per evitare la ricostruzione di tutti i widget modifico
la chiamata Provider.of<CounterModel>(context, listen: false); nel widget DemoPage
in modo che al cambiamento di CounterModel non vengano ricostruiti tutti i widget a partire da DemoPage.

Ora posso modificare CounterModel con i pulsanti, ma non avrò nessuna modifica nella UI.

Posso però spostare nel WidgetB l'aggiornamento della UI, e solo il WidgetB sarà ricostruito.