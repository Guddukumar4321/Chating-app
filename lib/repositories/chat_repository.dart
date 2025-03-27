
import '../../core/services/chat_service.dart';
import '../models/message_model.dart';

class ChatRepository {
  final ChatService chatService;

  ChatRepository(this.chatService);

  Future<List<MessageModel>> fetchMessages() => chatService.getMessages();
}
