// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modernlogintute/pages/account_page.dart';
import 'package:modernlogintute/pages/home_page.dart';
import 'package:modernlogintute/pages/login_or_register.dart';
import 'package:modernlogintute/pages/login_page.dart';

class AuthPage extends StatelessWidget{
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:StreamBuilder<User?>(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder:(context,snapshot){
          //user is logged in (yay)
          if (snapshot.hasData){
            return HomePage();
          }


          // user ain't logged in (bruh you stupid)
          else {
            return LoginOrRegisterPage();
          }
        } ,
      )
    );
  }

}