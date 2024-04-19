// To parse this JSON data, do
//
//     final exploreModel = exploreModelFromJson(jsonString);

import 'dart:convert';

ExploreModel exploreModelFromJson(String str) => ExploreModel.fromJson(json.decode(str));

String exploreModelToJson(ExploreModel data) => json.encode(data.toJson());

class ExploreModel {
  int? status;
  List<Datum>? data;

  ExploreModel({
    this.status,
    this.data,
  });

  factory ExploreModel.fromJson(Map<String, dynamic> json) => ExploreModel(
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
  dynamic profileImage;
  String? username;
  String? firstName;
  dynamic bio;
  dynamic website;
  int? postCount;
  int? followersCount;
  int? followingCount;

  Datum({
    this.id,
    this.profileImage,
    this.username,
    this.firstName,
    this.bio,
    this.website,
    this.postCount,
    this.followersCount,
    this.followingCount,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    profileImage: json["profile_image"],
    username: json["username"],
    firstName: json["first_name"],
    bio: json["bio"],
    website: json["website"],
    postCount: json["post_count"],
    followersCount: json["followers_count"],
    followingCount: json["following_count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profile_image": profileImage,
    "username": username,
    "first_name": firstName,
    "bio": bio,
    "website": website,
    "post_count": postCount,
    "followers_count": followersCount,
    "following_count": followingCount,
  };
}
