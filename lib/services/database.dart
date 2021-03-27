import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usersCollection = Firestore.instance.collection('users');

    // Future initNewUserData() async {
    //   return await usersCollection.document(uid).collection("profile").document.setData(
    //     {
    //       "a":"a"
    //     }
    //   );
    // }

}