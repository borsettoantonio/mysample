# Flutter: Esempio di gestione dello stato con provider - 1
01.05.2023

Esempio tratto dal libro "Flutter Complete Reference" di Alberto Miola a pag.299.

In MaterialApp creo una istanza di ChangeNotifierProvider che a sua volta
crea un CounterModel e lo mette a disposizione dei widget discendenti.

Definendo WidgetC non-const allora anch'esso viene ricostruito a ogni chiamata di setState.

Mettendo la chiamata Provider.of<CounterModel>(context) nel widget DemoPage
al cambiamento di CounterModel vengono ricostruiti tutti i widget a partire da DemoPage.