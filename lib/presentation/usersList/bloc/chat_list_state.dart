

import '../../../data/models/chat_model.dart';
import '../../../data/models/message_model.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final ChatModel chat;
  final List<MessageModel> messages;

  ChatLoaded({required this.chat, required this.messages});
}

class ChatError extends ChatState {
  final String message;
  ChatError(this.message);
}
