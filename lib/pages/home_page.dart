// ignore_for_file: deprecated_member_use

//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:modernlogintute/pages/newBible.dart';
import 'package:url_launcher/url_launcher.dart';
import 'newBible.dart';
import 'account_page.dart';
import 'bible_page.dart';

// ignore_for_file: prefer_const_constructors
class HomePage extends StatelessWidget {
  final Uri _url = Uri.parse('https://www.addiskidan.org/giving');
  final Uri _url2 = Uri.parse("https://www.addiskidan.org/");

  Future<void> llaunchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.menu,
                    color: Colors.black,
                    size: 50,
                  ),
                  Image.asset("lib/images/chruch.png", width: 150)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Wrap(spacing: 20, runSpacing: 20, children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BiblePage()),
                        );
                      },
                      child: SizedBox(
                          width: 160,
                          height: 160,
                          child: Card(
                              color: Color.fromARGB(255, 255, 255, 255),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Image.asset("lib/images/bible.png",
                                          width: 64),
                                      SizedBox(height: 10),
                                      Text("Bible",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      SizedBox(height: 5),
                                      Text("Read",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w200))
                                    ],
                                  ),
                                ),
                              ))),
                    ),
                    GestureDetector(
                      onTap: () => llaunchUrl(_url),
                      child: SizedBox(
                          width: 160,
                          height: 160,
                          child: Card(
                              color: Color.fromARGB(255, 255, 255, 255),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Image.asset("lib/images/donate.png",
                                            width: 64),
                                        SizedBox(height: 10),
                                        Text("Donate!",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(height: 5),
                                        Text("Every bit helps!",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w200))
                                      ],
                                    )),
                              ))),
                    ),
                    GestureDetector(
                      onTap: () => llaunchUrl(_url2),
                      child: SizedBox(
                          width: 160,
                          height: 160,
                          child: Card(
                              color: Color.fromARGB(255, 255, 255, 255),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Image.asset("lib/images/website.png",
                                            width: 64),
                                        SizedBox(height: 10),
                                        Text("Website",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(height: 5),
                                        Text("Check out our website!",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w200))
                                      ],
                                    )),
                              ))),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountPage()),
                        );
                      },
                      child: SizedBox(
                          width: 160,
                          height: 160,
                          child: Card(
                              color: Color.fromARGB(255, 255, 255, 255),
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Image.asset("lib/images/settings.png",
                                            width: 64),
                                        SizedBox(height: 10),
                                        Text("Settings",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(height: 5),
                                        Text(
                                            "Check out your profile or Logout!",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w200))
                                      ],
                                    )),
                              ))),
                    )
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
