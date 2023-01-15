import 'package:flutter/material.dart';
import 'package:qoutes/main.dart';

class MyWidget extends StatelessWidget {
  
String title;
String person;
Function delete;
BestQuotes item;
MyWidget({Key? key, required this.person,required this.title,required this.delete,required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
      margin: const EdgeInsets.all(17),
      color: const Color.fromARGB(255, 140, 181, 215),
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              title,
                style: TextStyle(fontSize: 20, color: Colors.white),
                textDirection: TextDirection.rtl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    delete(item);
                  },
                  icon: const Icon(Icons.delete),
                  iconSize: 27,
                  color: const Color.fromARGB(255, 255, 217, 217),
                ),
                 Text(person,
                    style: TextStyle(fontSize: 19, color: Colors.white),
                    textDirection: TextDirection.rtl),
              ],
            )
          ],
        ),
      ),
    );
  }
}
