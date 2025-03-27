import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

import '../../models/message_model.dart';


class ChatService {


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
      }

     return userChat;
  }
}
