import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreProvider{
  Future<void> sendData(){
   return Firestore
   .instance.collection('Users')
   .document('123123123')
   .setData({'email': 'testing@test.com', 'author': 'author'});
  }
  Stream<dynamic> getData(){
   Firestore.instance
       .collection('Users')
       .document('123123123')
       .get()
       .then((DocumentSnapshot ds) {
         print(ds.data);
   } );
  }
}

FireStoreProvider fireStoreProvider = FireStoreProvider();