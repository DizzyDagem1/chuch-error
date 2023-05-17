// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'bibleScreen.dart';

class BiblePage extends StatefulWidget {
   BiblePage({Key? key}) : super(key: key);
  @override
  State<BiblePage> createState() => _BiblePageState();
}
  
class _BiblePageState extends State<BiblePage> {
  List _items = [];
  final chapterController = TextEditingController();
  final bookController = TextEditingController();
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/amharic_bible.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["books"];
      print("$_items");
    }); 
  }
  @override
  Widget build(BuildContext context) {
    int? book = int.tryParse(bookController.text) ?? 1;
    int? chapter = int.tryParse(chapterController.text) ?? 1;
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Bible',
        ),
      ),
      
      body: Column(
        children: [
          _items.isNotEmpty
              ? Expanded(
                
                  child: ListView.builder(
                    
                    itemCount: _items.length,
                  
                    itemBuilder: (context, index) {
                      final _item = _items[21]["title"];
                    return Card(
                        key: ValueKey(_items[index]["books"]),
                        margin: const EdgeInsets.all(10),
                        color: Colors.amber.shade100,
                        child: ListTile(
                          leading: Text(_items[book]["title"]),
                          title: Text(_items[book-1]["chapters"][chapter]["chapter"]),
                          subtitle: Text(_items[index]["verses"].join("")),
                        ),
                      );
                      
                    },
                  ),
                )
                :
             ElevatedButton(
                  onPressed: () {
                    readJson();
                  },
                  child: Center(child: Text("Load"))
                  ),
               TextField(
                  controller: chapterController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your Chapter!",
                    
                  ),
                ),
                TextField(
                  controller: bookController,
                  decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    hintText: "Enter your Book! (as in a numbered list)"
                  ),
                )
        ],
      ),
    );
  }
}
