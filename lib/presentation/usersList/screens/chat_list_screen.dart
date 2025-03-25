import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../widgets/message_list.dart';
import '../bloc/chat_list_bloc.dart';
import '../bloc/chat_list_event.dart';
import '../bloc/chat_list_state.dart';

class UserChatScreen extends StatelessWidget {
  const UserChatScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocProvider.of<ChatBloc>(context)..add(FetchUsersListEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text("Chats"), elevation: 2, backgroundColor: AppColors.primary,),
        body: BlocBuilder<ChatBloc, ChatState>(
          builder: (context, state) {
            if (state is ChatLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ChatLoaded) {
              return MessageList(messages: state.messages);
            } else {
              return Center(child: Text("Error loading chat"));
            }
          },
        ),
      ),
    );
  }
}
