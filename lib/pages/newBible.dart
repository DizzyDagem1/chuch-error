import 'package:flutter/material.dart';

const int itemCount=20;

class newPage extends StatelessWidget {
  const newPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: itemCount,
      itemBuilder: ((context, int index) {
        return const ListTile(
          title:Text("Genesis")
        );
      }),
    );
  }
}
