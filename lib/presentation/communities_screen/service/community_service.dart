import 'dart:developer';

import 'package:clone_app/core/app_utils.dart';
import 'package:clone_app/repository/helper/api_helper.dart';

class CommunityService {
  static Future<dynamic> fetchData() async {
    try {
      var decodedData = await ApiHelper.getData(
          endPoint: "community/communityadd/",
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
