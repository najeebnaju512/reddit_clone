// To parse this JSON data, do
//
//     final communityModel = communityModelFromJson(jsonString);

import 'dart:convert';

CommunityModel communityModelFromJson(String str) => CommunityModel.fromJson(json.decode(str));

String communityModelToJson(CommunityModel data) => json.encode(data.toJson());

class CommunityModel {
    int? status;
    List<Datum>? data;

    CommunityModel({
        this.status,
        this.data,
    });

    factory CommunityModel.fromJson(Map<String, dynamic> json) => CommunityModel(
        status: json["status"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    String? communityName;
    String? image;
    dynamic content;
    int? user;
    List<dynamic>? followers;
    String? userName;

    Datum({
        this.id,
        this.communityName,
        this.image,
        this.content,
        this.user,
        this.followers,
        this.userName,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        communityName: json["community_name"],
        image: json["image"],
        content: json["content"],
        user: json["user"],
        followers: json["followers"] == null ? [] : List<dynamic>.from(json["followers"]!.map((x) => x)),
        userName: json["user_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "community_name": communityName,
        "image": image,
        "content": content,
        "user": user,
        "followers": followers == null ? [] : List<dynamic>.from(followers!.map((x) => x)),
        "user_name": userName,
    };
}
