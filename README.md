# Flutter: Esempio di gestione dello stato con setState()

Esempio tratto dal libro "Flutter Complete Reference" di Alberto Miola a pag.290.

La chiamata a setState provoca sempre la ricostruzione di WidgetB,
ma non quella di WidgetC che è definito const.

Definendo WidgetC non-const allora anch'esso viene ricostruito a ogni chiamata di setState.