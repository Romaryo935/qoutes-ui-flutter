// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:qoutes/widget/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class BestQuotes {
  String title;
  String author;
  BestQuotes({required this.title, required this.author});
}

class _QuotesState extends State<Quotes> {
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  List AllQuotes = [
    BestQuotes(author: "romaryo", title: "رايق من نوعة فاخر 🔥"),
    BestQuotes(author: "romaryo", title: "رايق من نوعة فاخر 🔥"),
    BestQuotes(author: "romaryo", title: "رايق من نوعة فاخر 🔥"),
    BestQuotes(author: "romaryo", title: "رايق من نوعة فاخر 🔥"),
    BestQuotes(author: "mark", title: "العقل السليم في البعد عن الحريم 😂"),
    BestQuotes(
        author: "amir",
        title: "كُتر التفكير فى الى ضااااع هيعمل لك فى دماغك صادااااع  😉 "),
    BestQuotes(
        author: "misho", title: "فرح نفسك بنفسك ومتستناش حاجة حلوة من حد  ✋ "),
  ];
    addQuotes(){
      setState(() {
         AllQuotes.add(BestQuotes(author: myController2.text, title: myController.text),);
      });
    }


  delete(BestQuotes iii) {
    setState(() {
      AllQuotes.remove(iii);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
                          controller: myController,
                          decoration: InputDecoration(hintText: 'Add Title'),
                          maxLength: 20,
                        ),
                        TextField(
                          controller: myController2,
                          decoration: InputDecoration(hintText: 'Add Author'),
                          maxLength: 20,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              addQuotes();
                            },
                            child: Text(
                              'ADD',
                              style: TextStyle(fontSize: 22),
                            ))
                      ],
                    ),
                  )
                ],
              );
            },
            isScrollControlled: true
          );
          
        },
        backgroundColor: const Color.fromARGB(255, 11, 88, 151),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 11, 88, 151),
        title: const Text(' Best Quotes'),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...AllQuotes.map((item) => MyWidget(
                  item: item,
                  delete: delete,
                  title: item.title,
                  person: item.author,
                )),
          ],
        ),
        
      ),
    );
  }
}
