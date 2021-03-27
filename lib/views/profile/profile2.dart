import 'package:flutter/material.dart';
import 'package:memory/services/auth.dart';
import 'package:memory/services/database.dart';
import 'package:memory/shared/constants.dart';
import 'package:memory/views/profile/profile_info_list.dart';
import 'package:provider/provider.dart';
import 'package:memory/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class Profile2 extends StatefulWidget {
  @override
  _Profile2State createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  String firstName = "";
  String lastName = "";
  String userName = "";
  String email = "";
  String dob = "";
  bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return isEditMode ? StreamProvider<UserProfile>.value(
      value: DatabaseService(uid: user.uid).userProfile,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xff111440),
          title: Text('Profile',
          style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            // fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(24)
              ),
              
              child: FlatButton.icon(onPressed: () async {
                setState(() {
                  isEditMode = !isEditMode;
                });
              },
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                label: Text('Edit',
                style: TextStyle(
                  color: Colors.white
                ),),
              ),
            ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // const Color(0xffFFA00E),
                // const Color(0xffFE7F1C),
                const Color(0xff111440),
                const Color(0xff2D2E4A),
              ],
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage('https://cdn2.iconfinder.com/data'
                            '/icons/social-flat-buttons-3/512/anonymous-512.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: Row(
                    children: [
                      Text('First Name: ',
                      style: TextStyle(
                          color: Colors.white,
                        fontSize: 18
                        ),
                      ),

                  Expanded(
                    child: Container(
                      // width: 200,
                        child: TextFormField(
                          validator: (val) =>
                          val.isEmpty ? 'Enter your first name' : null,
                          // obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              firstName = val;
                            });
                          },
                          decoration: profileTextFormDecoration.copyWith(hintText: 'Add First Name'),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: Row(
                    children: [
                      Text('Last Name: ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),

                  Expanded(
                    child: Container(
                      // width: 200,
                        child: TextFormField(
                          validator: (val) =>
                          val.isEmpty ? 'Enter your last name' : null,
                          // obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              lastName = val;
                            });
                          },
                          decoration: profileTextFormDecoration.copyWith(hintText: 'Add Last Name'),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: Row(
                    children: [
                      Text('Email: ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),

                  Expanded(
                    child: Container(
                      // width: 200,
                        child: TextFormField(
                          validator: (val) =>
                          val.isEmpty ? 'Enter your email' : null,
                          // obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                          decoration: profileTextFormDecoration.copyWith(hintText: 'Add email'),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: Row(
                    children: [
                      Text('DOB: ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),

                      Expanded(
                        child: Container(
                          // width: 200,
                          child: TextFormField(
                            validator: (val) =>
                            val.isEmpty ? 'Enter your DOB' : null,
                            // obscureText: true,
                            onChanged: (val) {
                              setState(() {
                                dob = val;
                              });
                            },
                            decoration: profileTextFormDecoration.copyWith(hintText: 'Add DOB'),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  child: Row(
                    children: [
                      Text('Username: ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),

                      Expanded(
                        child: Container(
                          // width: 200,
                          child: TextFormField(
                            validator: (val) =>
                            val.isEmpty ? 'Enter your username' : null,
                            // obscureText: true,
                            onChanged: (val) {
                              setState(() {
                                userName = val;
                              });
                            },
                            decoration: profileTextFormDecoration.copyWith(hintText: 'Add Username'),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.blueGrey[800];
                          else
                            return Colors.blueGrey[800];
                          return null; // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          isEditMode = false;
                        });
                        DatabaseService(uid:user.uid).updateProfileInfo(
                            {
                          "firstName": firstName,
                          "lastName": lastName,
                          "userName": userName,
                          "email": email,
                          "dob": dob,
                          }
                        );
                      }
                    },
                    child: Text('Save Changes'))
              ],
            ),
          ),
        ),
      ),
    ) : Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff111440),
        title: Text('Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
            // fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          FlatButton.icon(onPressed: () async {
            setState(() {
              isEditMode = !isEditMode;
            });
          },
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            label: Text(''),
          ),
        ],
      ),
      body:
      Container(
        width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // const Color(0xffFFA00E),
                // const Color(0xffFE7F1C),
                const Color(0xff111440),
                const Color(0xff2D2E4A),
              ],
            ),
          ),
        child: StreamBuilder (
          stream: Firestore.instance.collection('users').document(user.uid)
              .collection('profile').snapshots(),
          builder: (context, snapshot) {
             return snapshot.hasData ? ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  DocumentSnapshot profInfo = snapshot.data.documents[index];
                  return
                    Column(
                      children: [
                      GestureDetector(
                        onTap: () async {
                          await ImagePicker.pickImage(source: ImageSource.gallery);
                        },
                        child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage('https://cdn2.iconfinder.com/data'
                                        '/icons/social-flat-buttons-3/512/anonymous-512.png'),
                                    fit: BoxFit.fill
                                ),
                              ),
                            ),
                      ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(16),
                          child: Row(
                          children: [
                            Text('First Name: ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18
                              ),
                            ),
                              Text(profInfo['firstName'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Text('Last Name: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                ),
                              ),
                              Text(profInfo['lastName'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Text('Username: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                ),
                              ),
                              Text(profInfo['userName'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Text('Email: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                ),
                              ),
                              Text(profInfo['email'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Text('Date of birth: ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                ),
                              ),
                              Text(profInfo['dob'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ) ;//: Container();
                },
            ) : Container();
          },
        ),
      ),
      // Container(
      //   width: MediaQuery.of(context).size.width,
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //       colors: [
      //         // const Color(0xffFFA00E),
      //         // const Color(0xffFE7F1C),
      //         const Color(0xff111440),
      //         const Color(0xff2D2E4A),
      //       ],
      //     ),
      //   ),
      //   child:
      //     //ProfileInfoList(),
      //   Column(
      //     // crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Container(
      //         width: 120,
      //         height: 120,
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           image: DecorationImage(
      //               image: NetworkImage('https://cdn2.iconfinder.com/data'
      //                   '/icons/social-flat-buttons-3/512/anonymous-512.png'),
      //               fit: BoxFit.fill
      //           ),
      //         ),
      //       ),
      //       Container(
      //         width: MediaQuery.of(context).size.width,
      //         margin: EdgeInsets.all(16),
      //         child: Row(
      //           children: [
      //             Text('First Name: ',
      //               style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 18
      //               ),
      //             ),
      //
      //             Text('Eid',
      //               style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 18
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
