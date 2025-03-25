import 'package:chatdemo/core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/models/message_model.dart';
import '../bloc/chat_list_bloc.dart';
import '../bloc/chat_list_event.dart';


class ChatScreen extends StatelessWidget {
  final MessageModel user;

  ChatScreen({super.key, required this.user});

  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocProvider.of<ChatBloc>(context)..add(FetchChatDetailsEvent()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Text((user.sender??"").profileText(), style: TextStyle(color: AppColors.black.withOpacity(0.6), fontWeight: FontWeight.w700, fontSize: 20),),
              ),
              SizedBox(width: 10),
              Text(user.sender??""),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(child: buildMessageList()),
            buildMessageInput(context),
          ],
        ),
      ),
    );
  }

  Widget buildMessageList() {
    return ListView.builder(
      reverse: true,
      padding: EdgeInsets.all(10),
      itemCount: (user.chats??[]).length,
      itemBuilder: (context, index) {
        final message = (user.chats??[])[(user.chats??[]).length - index - 1];
        final isMe = message.id == "0";

        return Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: SizedBox(
            width: (message.message??"").length > 27 ? MediaQuery.of(context).size.width*0.65:null,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: isMe ? AppColors.myMessageBubble : AppColors.messageBubble,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(message.message??"", style: TextStyle(fontSize: 16, color: isMe ? Colors.white : Colors.black)),
            ),
          ),
        );
      },
    );

  }

  Widget buildMessageInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: "Type a message...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () {
            //  if (_messageController.text.isNotEmpty) {
               // context.read<ChatBloc>().add(SendMessageEvent(_messageController.text, user.userId??0));
               // _messageController.clear();
             // }
            },
            child: CircleAvatar(
              backgroundColor: AppColors.primary,
              radius: 25,
              child: Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
