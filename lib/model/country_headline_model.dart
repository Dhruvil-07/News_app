import 'dart:convert';

CountryHeallineModel countryHeallineModelFromJson(String str) => CountryHeallineModel.fromJson(json.decode(str));

String countryHeallineModelToJson(CountryHeallineModel data) => json.encode(data.toJson());

class CountryHeallineModel {
  Source? source;
  dynamic? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  CountryHeallineModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory CountryHeallineModel.fromJson(Map<String, dynamic> json) => CountryHeallineModel(
    source: Source.fromJson(json["source"]),
    author: json["author"],
    title: json["title"],
    description: json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source,
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toString(),
    "content": content,
  };
}

class Source {
  dynamic? id;
  String? name;

  Source({
    this.id,
    this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
