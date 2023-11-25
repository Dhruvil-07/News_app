import 'dart:convert';

CategoryHedalineModel categoryHedalineModelFromJson(String str) => CategoryHedalineModel.fromJson(json.decode(str));

String categoryHedalineModelToJson(CategoryHedalineModel data) => json.encode(data.toJson());

class CategoryHedalineModel {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  CategoryHedalineModel({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  factory CategoryHedalineModel.fromJson(Map<String, dynamic> json) => CategoryHedalineModel(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    url: json["url"],
    category: json["category"],
    language: json["language"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "url": url,
    "category": category,
    "language": language,
    "country": country,
  };
}
