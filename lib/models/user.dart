class User {
  final String uid;
  User({this.uid});

  String getUid(){
    return uid;
  }

}

class UserData {
  final String uid;
  // final Map hack;
  // final Map crack;
  // final Map debug;
  UserData({this.uid});
}

class UserProfile {
  // final String uid;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String dob;

  UserProfile({this.firstName, this.lastName,
  this.userName, this.email, this.dob});
}

