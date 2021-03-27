import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:memory/models/user.dart';

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

  UserProfile _userProfileFromSnapshot(DocumentSnapshot snaphot){
      return UserProfile(
        firstName: snaphot.data['firstName'] ?? '',
        lastName: snaphot.data['lastName'] ?? '',
        email: snaphot.data['email'] ?? '',
        userName: snaphot.data['userName'] ?? '',
        dob: snaphot.data['dob'] ?? '',
      );
  }

  Stream<UserProfile> get userProfile {
      return usersCollection.document(uid).collection('profile').document(uid)
    .snapshots().map(_userProfileFromSnapshot);
  }

}