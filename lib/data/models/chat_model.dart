
import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  String? name;
  String? description;
  String? image;

  ChatModel({
    this.name,
    this.description,
    this.image,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    name: json["name"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "image": image,
  };
}
