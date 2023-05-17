import "package:flutter/material.dart";
import "package:modernlogintute/components/my_button.dart";
import 'dart:io'; 
class BibleScreen extends StatefulWidget {
  const BibleScreen({super.key});
  @override
  State<BibleScreen> createState() => _BibleScreenState();
}

class _BibleScreenState extends State<BibleScreen> {
  final chapterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var chapter = 1;
    return Scaffold(
      body:SafeArea(
        child:SingleChildScrollView(
          child:Center(
            child:Column(
              children:[
                TextField(
                  controller: chapterController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your Chapter!",
                    
                  ),
                ),
              ]
            )
          )
        )
      )
    );
  }
}