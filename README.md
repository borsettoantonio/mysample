# Provider: esempio di metodo select
02.05.2023

Esempio di funzionamento di context.select().

Nel WidgetB ci sono due modi di accesso alla persona:

nel primo con context.select() il widget viene ricostruito solo se
si aggiorna il campo selezionato;

nel secondo con Provider.of<Person>() il widget viene ricostruito sempre
ad ogni aggiornamento di Person.