import 'package:flutter/material.dart';
import 'package:memory/models/user.dart';
import 'package:memory/views/profile/profile_info_tile.dart';
import 'package:provider/provider.dart';

class ProfileInfoList extends StatefulWidget {
  @override
  _ProfileInfoListState createState() => _ProfileInfoListState();
}

class _ProfileInfoListState extends State<ProfileInfoList> {
  @override
  Widget build(BuildContext context) {
    final profileInfo = Provider.of<List<UserProfile>>(context) ?? [];
    return ListView.builder(
      itemCount: profileInfo.length,
      itemBuilder: (context, index){
        return ProfileInfoTile();
      },
    );
  }
}

