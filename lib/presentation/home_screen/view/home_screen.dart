import 'package:clone_app/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:clone_app/repository/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_config/app_config.dart';
import '../../bottom_navigation_screen/controller/bottom_nav_con';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("home screen");
      Provider.of<HomeController>(context, listen: false)
          .fetchHomeData(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.amber,
          title: Text(
            "Home",
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Provider.of<BottomNavigationController>(context, listen: false)
                    .currentIndex = 5;
              },
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/reddit3.jpg"),
                minRadius: 15,
              ),
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        drawer: drawer(),
        body: RefreshIndicator(
          onRefresh: () => Provider.of<HomeController>(context, listen: false)
              .fetchHomeData(context),
          child: Consumer<HomeController>(
            builder: (context, ctrl, child) {
              return ctrl.isLoading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: ctrl.homeModel.data?.length,
                      itemBuilder: (context, index) {
                        var profileImageUrl = ctrl.homeModel.data?[index]
                                    .creator?.profileImage ==
                                null
                            ? "https://th.bing.com/th/id/OIP.y6HMdOJ4LiIUWk7n5ZGlpAHaHa?w=480&h=480&rs=1&pid=ImgDetMain"
                            : AppConfig.mediaurl +
                                "${ctrl.homeModel.data?[index].creator?.profileImage}";
                        var imageUrl = ctrl.homeModel.data?[index].file == null
                            ? "https://th.bing.com/th/id/OIP.y6HMdOJ4LiIUWk7n5ZGlpAHaHa?w=480&h=480&rs=1&pid=ImgDetMain"
                            : AppConfig.mediaurl +
                                "${ctrl.homeModel.data?[index].file}";
                        return Card(
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(profileImageUrl),
                                      backgroundColor: Colors.grey,
                                      radius: 20,
                                    ),
                                    SizedBox(width: 8.0),
                                    Text(
                                      "${ctrl.homeModel.data?[index].creator?.username}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(Icons.more_vert_outlined),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${ctrl.homeModel.data?[index].location}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      "${ctrl.homeModel.data?[index].caption}",
                                    ),
                                    SizedBox(height: 8.0),
                                  ],
                                ),
                              ),
                              Image.network(
                                "${imageUrl}",
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 300,
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Provider.of<HomeController>(context,
                                                listen: false)
                                            .onlike(context, id: 1.toString());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(width: 1)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(
                                              ctrl.homeModel.data?[index]
                                                          .isLiked ==
                                                      true
                                                  ? null
                                                  : Icons.thumb_up_alt,
                                            ),
                                            Text(
                                                "${ctrl.homeModel.data?[index].likeCount}"),
                                            Icon(
                                              ctrl.homeModel.data?[index]
                                                          .isLiked ==
                                                      false
                                                  ? null
                                                  : Icons
                                                      .arrow_downward_outlined,
                                              size: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(width: 1)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.message_outlined),
                                          Text(
                                              "${ctrl.homeModel.data?[index].comments?.length} Comments"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
            },
          ),
        ));
  }
}
