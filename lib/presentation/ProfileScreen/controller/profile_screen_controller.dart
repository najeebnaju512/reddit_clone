import 'dart:convert';
import 'dart:developer';

import 'package:clone_app/core/app_utils.dart';
import 'package:clone_app/presentation/FirstScreen/view/first_screen.dart';
import 'package:clone_app/presentation/ProfileScreen/model/user_profile_model.dart';
import 'package:clone_app/presentation/ProfileScreen/service/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_config/app_config.dart';

class ProfileController extends ChangeNotifier {
  UserProfileModel userProfileModel = UserProfileModel();
  bool isLoadingProfile = false;
  late SharedPreferences sharedPreferences;
  var data;

  fetchProfile(context) {
    isLoadingProfile = true;
    notifyListeners();

    getUSerData().then((data) {
      ProfileService.fetchProfile(data).then((value) {
        log("ProfileController -> fetchProfile()");
        if (value["status"] == 1) {
          userProfileModel = UserProfileModel.fromJson(value);
          isLoadingProfile = false;
        } else {
          AppUtils.oneTimeSnackBar("error", context: context);
        }
        notifyListeners();
      });
    });
  }

  Future<String> getUSerData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var storedData;
    storedData = sharedPreferences.getString(AppConfig.loginData);
    data = jsonDecode(storedData);
    log("storedData -> $data");
    log("username -> ${data["username"]}");
    return data["username"];
  }

  void logOutFunction(BuildContext context) async{
    deleteUserData().then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const FirstScreen()),
              (route) => false);
      setStatus();
    });
  }
  deleteUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(AppConfig.loginData);
  }
  void setStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool(AppConfig.status, false);
  }
}
