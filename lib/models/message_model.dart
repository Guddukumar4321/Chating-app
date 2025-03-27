
import 'dart:convert';

MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  int? userId;
  String? sender;
  List<Chat>? chats;
  String? image;

  MessageModel({
    this.userId,
    this.sender,
    this.chats,
    this.image,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    userId: json["user_id"],
    sender: json["sender"],
    chats: json["chats"] == null ? [] : List<Chat>.from(json["chats"]!.map((x) => Chat.fromJson(x))),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "user_id":userId,
    "sender": sender,
    "chats": chats == null ? [] : List<dynamic>.from(chats!.map((x) => x.toJson())),
    "image": image,
  };
}

class Chat {
  String? id;
  String? message;

  Chat({
    this.id,
    this.message,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    id: json["id"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "message": message,
  };
}
