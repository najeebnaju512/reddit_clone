// import 'dart:developer';

// import 'package:clone_app/presentation/chat_screen/view/chat_screen.dart';
// import 'package:clone_app/presentation/communities_screen/view/communities_screen.dart';
// import 'package:clone_app/presentation/create_screen/view/create_screen.dart';
// import 'package:clone_app/presentation/explore_screen/view/explore_screen.dart';
// import 'package:clone_app/presentation/home_screen/view/home_screen.dart';
// import 'package:clone_app/presentation/inbox_screen/view/inbox_screen.dart';
// import 'package:clone_app/presentation/ProfileScreen/view/ProfileScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../controller/bottom_nav_con';

// class BottomNavScreen extends StatefulWidget {
//   const BottomNavScreen({super.key});

//   @override
//   State<BottomNavScreen> createState() => _BottomNavScreenState();
// }

// class _BottomNavScreenState extends State<BottomNavScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         extendBody: true,
//         body: Consumer<BottomNavigationController>(
//           builder: (context, provider, child) {
//             return IndexedStack(
//               index: provider.currentIndex,
//               children: [
//                 HomeScreen(),
//                 CommunityScreen(),
//                 CreateScreen(),
//                 ExploreScreen(),
//                 // InboxScreen(),
//                 ProfileScreen()
//               ],
//             );
//           },
//         ),
//         bottomNavigationBar: Consumer<BottomNavigationController>(
//           builder: (context, provider, child) {
//             return Padding(
//               padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: BottomNavigationBar(
//                   onTap: (index) {
//                     provider.currentIndex = index;
//                     log("tapped ${provider.currentIndex}");
//                   },
//                   type: BottomNavigationBarType.fixed,
//                   currentIndex: provider.currentIndex,
//                   elevation: 0,
//                   backgroundColor: Colors.white,
//                   unselectedItemColor: Colors.grey,
//                   selectedItemColor: Colors.black,
//                   showSelectedLabels: true,
//                   showUnselectedLabels: false,
//                   items: [
//                     BottomNavigationBarItem(
//                       icon: Icon(Icons.home_rounded),
//                       label: 'Home',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Icon(Icons.groups),
//                       label: 'Community',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Icon(Icons.add),
//                       label: 'Create',
//                     ),
//                     BottomNavigationBarItem(
//                       icon: Icon(Icons.travel_explore_sharp),
//                       label: 'Explore',
//                     ),
//                     // BottomNavigationBarItem(
//                     //   icon: Icon(Icons.notifications),
//                     //   label: 'Inbox',
//                     // ),
//                     BottomNavigationBarItem(
//                         icon: Icon(Icons.person), label: 'Profile')
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'dart:developer';

import 'package:clone_app/presentation/chat_screen/view/chat_screen.dart';
import 'package:clone_app/presentation/communities_screen/view/communities_screen.dart';
import 'package:clone_app/presentation/create_screen/view/create_screen.dart';
import 'package:clone_app/presentation/explore_screen/view/explore_screen.dart';
import 'package:clone_app/presentation/home_screen/view/home_screen.dart';
import 'package:clone_app/presentation/inbox_screen/view/inbox_screen.dart';
import 'package:clone_app/presentation/ProfileScreen/view/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/bottom_nav_con';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  List screens = [
    HomeScreen(),
    CommunityScreen(),
    CreateScreen(),
    ExploreScreen(),
    ProfileScreen(),

    // CreateScreen(),
    // ExploreScreen(),
    // // InboxScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: screens[_currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
                log("tapped $_currentIndex");
              },
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              elevation: 0,
              backgroundColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.black,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.groups),
                  label: 'Community',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: 'Create',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.travel_explore_sharp),
                  label: 'Explore',
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.notifications),
                //   label: 'Inbox',
                // ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
