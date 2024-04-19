import 'package:clone_app/core/app_utils.dart';
import 'package:clone_app/presentation/explore_screen/model/explorer_model.dart';
import 'package:flutter/material.dart';

import '../service/explore_service.dart';

class ExploreController extends ChangeNotifier {
  ExploreModel exploreModel = ExploreModel();
  bool isLoading = false;

  fetchData(context) {
    isLoading = true;
    notifyListeners();
    ExploreService.fetchData().then((value) {
      if (value["status"] == 1) {
        exploreModel = ExploreModel.fromJson(value);
        isLoading = false;
      } else {
        AppUtils.oneTimeSnackBar("error", context: context);
      }
      notifyListeners();
    });
  }
}
