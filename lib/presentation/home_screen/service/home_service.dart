import 'package:clone_app/core/app_utils.dart';
import 'package:clone_app/repository/helper/api_helper.dart';

class HomeService {
  static Future<dynamic> fetchData() async {
    try {
      var resData = ApiHelper.getData(endPoint: "images/allimage/");
      return resData;
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> postLike(String id) async {
    try {
      var resData = ApiHelper.postData(
          endPoint: "images/1/likes/",
          
          header:
              ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()));

      print("${"images/$id/likes/"}");
      return resData;
    } catch (e) {
      print(e);
    }
  }
}
