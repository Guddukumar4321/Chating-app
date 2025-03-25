import 'package:chatdemo/core/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import '../../core/routes/app_routes.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/message_model.dart';
import '../usersList/screens/chat_screen.dart';

class MessageList extends StatelessWidget {
  final List<MessageModel> messages;

  const MessageList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: messages.length,
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) {
        final message = messages[index];
        return InkWell(
          onTap: (){
            Navigator.pushNamed(
              context,
              AppRoutes.chatScreen,
              arguments: {
                "user": message, // Pass user object
              },
            );

          },
          child: SizedBox(
            height: 65,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
          
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25)
                  ),
                  child: Text((message.sender??"").profileText(), style: TextStyle(color: AppColors.black.withOpacity(0.6), fontWeight: FontWeight.w700, fontSize: 20),),
                ),
                SizedBox(width: 5,),
                Expanded(
                  child: ListTile(
                    title: Text(message?.sender??"", maxLines: 1, overflow: TextOverflow.ellipsis),
                    subtitle: Text(message?.chats?.last.message??"", maxLines: 1, overflow: TextOverflow.ellipsis,),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index){
        return SizedBox(
          height: 0.2,
          child: Divider(color: AppColors.darkGray.withOpacity(0.2), height: 0.2,),
        );
      },
    );
  }
}
