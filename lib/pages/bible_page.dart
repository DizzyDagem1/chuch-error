// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "biblePODO.dart";

class BiblePage extends StatefulWidget {
  BiblePage({Key? key}) : super(key: key);
  @override
  State<BiblePage> createState() => _BiblePageState();
}

// To parse this JSON data, do
//
//     final amharicBible = amharicBibleFromJson(jsonString);

AmharicBible amharicBibleFromJson(String str) =>
    AmharicBible.fromJson(json.decode(str));

String amharicBibleToJson(AmharicBible data) => json.encode(data.toJson());

class AmharicBible {
  String title;
  List<Bible> bible;

  AmharicBible({
    required this.title,
    required this.bible,
  });

  factory AmharicBible.fromJson(Map<String, dynamic> json) => AmharicBible(
        title: json["title"],
        bible: List<Bible>.from(json["bible"].map((x) => Bible.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "bible": List<dynamic>.from(bible.map((x) => x.toJson())),
      };
}

class Bible {
  String title;
  String abbv;
  List<Chapter> chapters;

  Bible({
    required this.title,
    required this.abbv,
    required this.chapters,
  });

  factory Bible.fromJson(Map<String, dynamic> json) => Bible(
        title: json["title"],
        abbv: json["abbv"],
        chapters: List<Chapter>.from(
            json["chapters"].map((x) => Chapter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "abbv": abbv,
        "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
      };
}

class Chapter {
  String? chapter;
  String? title;
  List<String>? verses;

  Chapter({this.chapter, this.title, this.verses});

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        chapter: json["chapter"],
        title: json["title"],
        verses: List<String>.from(json["verses"].map((x) => x)),
      );

  Map<String, dynamic> toJson() =>
      {"chapter": chapter, "title": title, "verses": verses};
}

class _BiblePageState extends State<BiblePage> {
  List _items = [];
  final chapterController = TextEditingController();
  final bookController = TextEditingController();
  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/amharic_bible.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["bible"];
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
          'Amharic Bible',
        ),
      ),
      body: SingleChildScrollView(
  child: Column(
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.05, // Adjust the height as needed
        child: _items.isNotEmpty
            ? ListView.builder(
                physics: NeverScrollableScrollPhysics(), // Disable scrolling in ListView.builder
                shrinkWrap: true,
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Container();
                },
              )
            : ElevatedButton(
                onPressed: () {
                  readJson();
                },
                child: Center(child: Text("Load")),
              ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: chapterController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter your Chapter!",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: bookController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Enter your Book! (as in a numbered list)",
          ),
        ),
      ),
      ListTile(
        leading: Text(
          _items.isNotEmpty && book < _items.length ? _items[book]["title"] : "",
        ),
        subtitle: Text(
          _items.isNotEmpty && book < _items.length
              ? "${chapter < _items[book]["chapters"].length ? Chapter.fromJson(_items[book]["chapters"][chapter - 1]).verses?.join(" ") : ""}"
              : "",
        ),
      ),
      SizedBox(height: 20), // Add spacing between the text fields and buttons
    ],
  ),
),



    );
  }
}
