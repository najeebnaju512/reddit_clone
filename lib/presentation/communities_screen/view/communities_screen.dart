import 'package:clone_app/presentation/ProfileScreen/controller/profile_screen_controller.dart';
import 'package:clone_app/presentation/communities_screen/controller/communities_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:clone_app/repository/community_screen_widget.dart';
import 'package:clone_app/repository/drawer_widget.dart';
import 'package:provider/provider.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CommunityController>(context, listen: false)
          .fetchData(context);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Consumer<CommunityController>(builder: (context, controller, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Community",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            // IconButton(
            //   onPressed: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => CommunitySearchScreen(),
            //       ),
            //     );
            //   },
            //   icon: Icon(Icons.search, size: 35),
            // ),
            SizedBox(width: 5),
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                  "${Provider.of<ProfileController>(context).userProfileModel.data?.profileImage}"),
            ),
            SizedBox(width: 15),
          ],
        ),
        drawer: drawer(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: controller.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  //scrollDirection: Axis.horizontal,
                  itemCount: controller.communityModel.data?.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) =>
                      CommunityScreenWidget(
                    dp: '${controller.communityModel.data?[index].image}',
                    username:
                        '${controller.communityModel.data?[index].communityName}',
                  ),
                ),
        ),
      );
    });
  }
}
