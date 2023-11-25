import 'dart:convert';

ChannelHeaddlineModel channelHeaddlineModelFromJson(String str) => ChannelHeaddlineModel.fromJson(json.decode(str));

String channelHeaddlineModelToJson(ChannelHeaddlineModel data) => json.encode(data.toJson());

class ChannelHeaddlineModel {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  ChannelHeaddlineModel({
     this.source,
     this.author,
     this.title,
     this.description,
     this.url,
     this.urlToImage,
     this.publishedAt,
     this.content,
  });

  factory ChannelHeaddlineModel.fromJson(Map<String, dynamic> json) => ChannelHeaddlineModel(
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
  };
}

class Source {
  String? id;
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