

import '../../core/services/chat_service.dart';
import '../models/chat_model.dart';
import '../models/message_model.dart';

class ChatRepository {
  final ChatService chatService;

  ChatRepository(this.chatService);

  Future<ChatModel> fetchChatDetails() => chatService.getChatDetails();

  Future<List<MessageModel>> fetchMessages() => chatService.getMessages();
}
