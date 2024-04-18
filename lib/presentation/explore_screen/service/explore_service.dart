import 'dart:developer';

import 'package:clone_app/core/app_utils.dart';
import 'package:clone_app/repository/helper/api_helper.dart';

class ExploreService{
  static Future<dynamic> fetchData() async{
    try{
      var decodedData= ApiHelper.getData(endPoint: "accounts/explore/",header: ApiHelper.getApiHeader(access:await AppUtils.getAccessKey()));
      return decodedData;
    }catch(e){
      log("$e");
    }
  }
  
}