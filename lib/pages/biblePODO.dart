// To parse this JSON data, do
//
//     final amharicBible = amharicBibleFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';
import "bible_page.dart";
AmharicBible amharicBibleFromJson(String str) => AmharicBible.fromJson(json.decode(str));

String amharicBibleToJson(AmharicBible data) => json.encode(data.toJson());

class AmharicBible {
    String title;
    List<Book> books;

    AmharicBible({
        required this.title,
        required this.books,
    });

    factory AmharicBible.fromJson(Map<String, dynamic> json) => AmharicBible(
        title: json["title"],
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
    };
}

class Book {
    String title;
    String abbv;
    List<Chapter> chapters;

    Book({
        required this.title,
        required this.abbv,
        required this.chapters,
    });

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["title"],
        abbv: json["abbv"],
        chapters: List<Chapter>.from(json["chapters"].map((x) => Chapter.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "abbv": abbv,
        "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
    };
}

class Chapter {
    String chapter;
    String title;
    List<String> verses;

    Chapter({
        required this.chapter,
        required this.title,
        required this.verses,
    });

    factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        chapter: json["chapter"],
        title: json["title"],
        verses: List<String>.from(json["verses"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "chapter": chapter,
        "title": title,
        "verses": List<dynamic>.from(verses.map((x) => x)),
    };
}
