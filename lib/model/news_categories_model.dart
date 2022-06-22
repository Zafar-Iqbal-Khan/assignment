// To parse this JSON data, do
//
//     final newsCategories = newsCategoriesFromJson(jsonString);

import 'dart:convert';

List<NewsCategories> newsCategoriesFromJson(String str) =>
    List<NewsCategories>.from(
        json.decode(str).map((x) => NewsCategories.fromJson(x)));

String newsCategoriesToJson(List<NewsCategories> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsCategories {
  NewsCategories({
    this.id,
    this.name,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.position,
    this.engName,
  });

  int? id;
  String? name;
  String? image;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? position;
  String? engName;

  factory NewsCategories.fromJson(Map<String, dynamic> json) => NewsCategories(
        id: json["id"],
        name: json["name"],
        image: json["image"] == null ? null : json["image"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        position: json["position"],
        engName: json["eng_name"] == null ? null : json["eng_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image == null ? null : image,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "position": position,
        "eng_name": engName == null ? null : engName,
      };
}
