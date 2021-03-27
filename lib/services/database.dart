import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference usersCollection = Firestore.instance.collection('users');

    Future initNewUserData() async {
      initUserProfile();
      initUserCategories();
    }

    Future initUserProfile() async {
      return await usersCollection.document(uid).collection("profile").document(uid).setData(
          {
            "firstName": "",
            "lastName": "",
            "dob": "",
            "email":"",
            "userName":"",
          }
      );
    }

  Future initUserCategories() async {
    return await usersCollection.document(uid).collection("categories").document(uid).setData(
        {
          "running": false,
          "eating": false,
          "reading": false,
          "watching": false,
          "exercising": false,
          "studying": false,
          "meditating": false,
          "praying": false,
          "working": false,
        }
    );
  }

  Future toggleUserCategory(String category, bool b) async {
      return await usersCollection.document(uid).collection('categories').document(uid).updateData(
        {
          category: b
        }
      );
  }

  // Future get userProfileInfo {
  //     return usersCollection.document(uid).collection('profile')
  //         .document('uid').snapshots().map((event) => null);
  // }

  Future updateProfileInfo(Map newInfo) async {
    Map<String, dynamic> updatedMap = new Map<String, dynamic>.from(newInfo );
      return await usersCollection.document(uid).collection("profile").document(uid).updateData(updatedMap);
  }


}