import 'package:clone_app/presentation/ProfileScreen/controller/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_config/app_config.dart';

class FollowingList extends StatefulWidget {


  @override
  State<FollowingList> createState() => _FollowingListState();
}

class _FollowingListState extends State<FollowingList> {
  @override
  void initState() {
    Provider.of<ProfileController>(context,listen: false).fetchFollowing(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(
      builder: (context,controller,_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Following List'),
          ),
          body: ListView.builder(
            itemCount: controller.followingModel.data?.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("${controller.followingModel.data?[index].profileImage ?? "${AppConfig.noDp}"}"),
                ),
                title: Text("${controller.followingModel.data?[index].username}"),
                onTap: () {},
                trailing: IconButton(
                  icon: Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              );
            },
          ),
        );
      }
    );
  }
}
