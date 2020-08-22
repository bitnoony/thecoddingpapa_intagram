import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:thecoddingpapa_intagram/constants/material_white_color.dart';
import 'package:thecoddingpapa_intagram/screens/auth_page.dart';
import 'package:thecoddingpapa_intagram/main_page.dart';
import 'package:thecoddingpapa_intagram/widgets/my_progress_indicator.dart';


void main(){
  return runApp(MyApp());
}
bool isItFirstData = true;

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
          if(isItFirstData){
            isItFirstData = false;
          return MyProgressIndicator();
          } else {
            if(snapshot.hasData){
              return MainPage();
            } return AuthPage();
          }}
      ),
      theme: ThemeData(primarySwatch: white),
    );
  }
}


