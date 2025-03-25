import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../../data/models/chat_model.dart';
import '../../data/models/message_model.dart';
import '../value/user_data.dart';


class ChatService {
  Future<ChatModel> getChatDetails() async {
    await Future.delayed(Duration(seconds: 1));
    return ChatModel(name: "ChatBloc", description: "A fast and simple chat app");
  }

  Future<List<MessageModel>> getMessages() async {
    await Future.delayed(Duration(seconds: 1));
      List<MessageModel> userChat = [];

      try {
        ///read data from json file
        final String response = await rootBundle.loadString('assets/json/chat_data.json');
        final List<dynamic> jsonData = json.decode(response);
        userChat =  jsonData.map((e) => MessageModel.fromJson(e)).toList();


        ///read data from global variable
       // userChat =  usersData.map((e) => MessageModel.fromJson(e)).toList();
      } catch (e) {
        print("Error loading JSON: $e");
        return [];
      }

     return userChat;
  }
}
