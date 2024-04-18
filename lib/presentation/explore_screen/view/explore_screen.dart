import 'package:clone_app/repository/community_screen_widget.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            backgroundImage: AssetImage("assets/images/reddit3.jpg"),
          ),
          SizedBox(width: 15),
        ],
      ),
      body: ListView.builder(
        //scrollDirection: Axis.horizontal,
        itemCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) =>
            CommunityScreenWidget(),
      ),
    );
  }
}
