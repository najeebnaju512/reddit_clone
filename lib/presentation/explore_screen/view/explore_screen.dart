import 'package:clone_app/app_config/app_config.dart';
import 'package:clone_app/presentation/ProfileScreen/controller/profile_screen_controller.dart';
import 'package:clone_app/presentation/explore_screen/controller/explore_controller.dart';
import 'package:clone_app/repository/community_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ExploreController>(context, listen: false).fetchData(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExploreController>(builder: (context, controller, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Explore",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            SizedBox(width: 5),
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(
                  "${Provider.of<ProfileController>(context, listen: false).userProfileModel.data?.profileImage}"),
            ),
            SizedBox(width: 15),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView.builder(
            //scrollDirection: Axis.horizontal,
            itemCount: controller.exploreModel.data?.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) =>
                CommunityScreenWidget(
              dp: '${controller.exploreModel.data?[index].profileImage ?? "${AppConfig.noDp}"}',
              username: '${controller.exploreModel.data?[index].username}',
            ),
          ),
        ),
      );
    });
  }
}
