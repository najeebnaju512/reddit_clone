
import 'package:clone_app/presentation/bottom_navigation_screen/controller/bottom_nav_con';
import 'package:clone_app/presentation/communities_screen/controller/communities_screen_controller.dart';
import 'package:clone_app/presentation/explore_screen/controller/explore_controller.dart';
import 'package:clone_app/presentation/home_screen/controller/home_screen_controller.dart';
import 'package:clone_app/presentation/ProfileScreen/controller/profile_screen_controller.dart';
import 'package:clone_app/presentation/login/controller/login_controller.dart';
import 'package:clone_app/presentation/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/create_screen/controller/create_controller.dart';
import 'presentation/registration/controller/registration_controller.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => RegistrationController()),
      ChangeNotifierProvider(create: (context) => LoginController()),
      ChangeNotifierProvider(create: (context) => HomeController()),
      ChangeNotifierProvider(create: (context) => BottomNavigationController()),
      ChangeNotifierProvider(create: (context) => ProfileController()),
      ChangeNotifierProvider(create: (context) => CreateController()),
      ChangeNotifierProvider(create: (context) => ExploreController()),
      ChangeNotifierProvider(create: (context)=> CommunityController())

    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
