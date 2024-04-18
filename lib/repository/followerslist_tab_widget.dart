import 'package:clone_app/presentation/ProfileScreen/controller/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_config/app_config.dart';

class FollowersList extends StatefulWidget {
  @override
  State<FollowersList> createState() => _FollowersListState();
}

class _FollowersListState extends State<FollowersList> {
  @override
  void initState() {
    Provider.of<ProfileController>(context, listen: false).fetchFollowers(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(builder: (context, controller, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Followers List'),
        ),
        body: controller.followersModel.data!.isEmpty
            ? Center(child: Text("No Followers",style: TextStyle(color: Colors.black),))
            : ListView.builder(
                itemCount: controller.followersModel.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "${controller.followersModel.data?[index].profileImage ?? "${AppConfig.noDp}"}"),
                    ),
                    title: Text("${controller.followersModel.data?[index].username}"),
                    onTap: () {},
                    trailing: Container(
                      color: Colors.black12,
                      width: 10,
                      height: 2,
                      child: Text(
                        'Following',
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  );
                },
              ),
      );
    });
  }
}
