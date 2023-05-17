import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class AccountPage extends StatelessWidget{
   AccountPage({super.key});
   final user = FirebaseAuth.instance.currentUser!;
  //sign out method
  void signUserOut(){
    FirebaseAuth.instance.signOut();
    
  }
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(actions:[IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))]),
      body:Center(child: Text("my email is "+user.email!)),
    );
  }
}