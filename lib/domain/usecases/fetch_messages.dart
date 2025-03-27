
import '../../models/message_model.dart';
import '../../repositories/chat_repository.dart';

class FetchChatDetails {
  final ChatRepository repository;
  FetchChatDetails(this.repository);

  Future<List<MessageModel>> execute() => repository.fetchMessages();
}
