import 'package:clone_app/core/app_utils.dart';
import 'package:clone_app/presentation/communities_screen/model/community_model.dart';
import 'package:clone_app/presentation/communities_screen/service/community_service.dart';
import 'package:flutter/material.dart';

class CommunityController extends ChangeNotifier {
  CommunityModel communityModel = CommunityModel();
  bool isLoading = false;
  fetchData(context) {
    isLoading = true;
    notifyListeners();
    CommunityService.fetchData().then((value) {
      if (value["status"] == 1) {
        communityModel = CommunityModel.fromJson(value);
        isLoading = false;
      } else {
        AppUtils.oneTimeSnackBar("error", context: context);
      }
      notifyListeners();
    });
  }
}
