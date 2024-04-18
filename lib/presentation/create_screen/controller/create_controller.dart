import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../app_config/app_config.dart';
import '../../../core/app_utils.dart';

class CreateController extends ChangeNotifier {
  void onPost(BuildContext context,
      {File? selectedImage, required String loc, required String cap}) async {
    try {
      String? token = await AppUtils.getAccessKey();
      if (token != null) {
        var url = "${AppConfig.baseurl}images/image/";
        onUploadImage(url, selectedImage, loc, cap, token).then((value) {
          log("${value.statusCode}");
          if (value.statusCode == 201) {
            AppUtils.oneTimeSnackBar("Posted Successfully",
                context: context, bgColor: Colors.green, time: 3);
          } else {
            AppUtils.oneTimeSnackBar("Failed to Post",
                context: context, bgColor: Colors.red);
          }
        });
      } else {
        log("access token is null");
      }
    } catch (e) {
      log("$e");
    }
    notifyListeners();
  }

  Future<http.Response> onUploadImage(
    String url,
    File? selectedImage,
    String loc,
    String cap,
    String accessToken,
  ) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    Map<String, String> headers = {
      "Content-type": "multipart/form-data",
      // 'Accept': 'application/json',
      "Authorization": "Bearer $accessToken"
    };
    if (selectedImage != null) {
      log("image size -> ${selectedImage.lengthSync()} B");
      request.files
          .add(await http.MultipartFile.fromPath('file', selectedImage.path));
    }
    request.fields["location"] = loc;
    request.fields["caption"] = cap;

    request.headers.addAll(headers);
    log("request: $request");
    var res = await request.send();
    return await http.Response.fromStream(res);
  }
}
