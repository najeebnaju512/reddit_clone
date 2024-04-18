import 'package:clone_app/app_config/app_config.dart';
import 'package:clone_app/presentation/ProfileScreen/controller/profile_screen_controller.dart';
import 'package:clone_app/repository/followerslist_tab_widget.dart';
import 'package:clone_app/repository/followinglist_tab_widget.dart';
import 'package:clone_app/repository/profile_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  fetchData() {
    Provider.of<ProfileController>(context, listen: false).fetchProfile(context);
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(builder: (context, controller, _) {
      return controller.isLoadingProfile == true
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                title: Text('Profile'),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
                  IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {
                      _showAlertDialog(context);
                    },
                  ),
                ],
              ),
              drawer: ProfileDrawer(),
              body: RefreshIndicator(
                onRefresh: () => Provider.of<ProfileController>(context, listen: false).fetchProfile(context),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                "${controller.userProfileModel.data?.profileImage ?? "${AppConfig.noDp}"}"),
                          ),
                          SizedBox(height: 10),
                          Text(
                            controller.userProfileModel.data?.username ?? "no username",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "${controller.userProfileModel.data?.postCount ?? "0"}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                'posts',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => FollowersList()),
                                  );
                                },
                                child: Text(
                                  "${controller.userProfileModel.data?.followersCount ?? "0"}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                'followers',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => FollowingList()),
                                  );
                                },
                                child: Text(
                                  '${controller.userProfileModel.data?.followingCount ?? "0"}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                'following',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: GridView.builder(
                          itemCount: controller.userProfileModel.img?.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10),
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "${AppConfig.mediaurl}${controller.userProfileModel.img?[index].file}"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
    });
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                backgroundColor: Colors.white,
                title: Text(
                  'Do you wish to Logout',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Cancel",
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<ProfileController>(context, listen: false).logOutFunction(context);
                        },
                        child: Text(
                          "Logout",
                        ),
                      )
                    ],
                  )
                ]));
  }
}
