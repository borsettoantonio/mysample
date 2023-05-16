# Esempio di uso di StreamBuilder
16.05.2023

Nel widget _HomeScreenState c'è un StreamController che viene creato
in initState associandolo al metodo parti() che genera una sequenza di
interi e li inserisce nello stream.

La generazione della sequenza è controlata dalle variabili 'end' e 'on'
che ripettivamente bloccano definitivamente la generazione dei dati,
oppure la interrompono e riprendono (on).

Nel metodo build la pagina è generata usando StreamBuilder che fornisce i dati
provenienti dallo stream per costruire i vari widget.

Tre pulsanti controllano la generazione degli eventi.