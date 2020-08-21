import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thecoddingpapa_intagram/constants/material_white_color.dart';
import 'package:thecoddingpapa_intagram/screens/auth_page.dart';
import 'main_page.dart';

void main(){
  return runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return MainPage();
          }
          return AuthPage();
        }
      ),
      theme: ThemeData(
        primarySwatch: white
      ),
    );
  }
}


