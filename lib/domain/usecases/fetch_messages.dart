
import '../../data/models/message_model.dart';
import '../../data/repositories/chat_repository.dart';

class FetchMessages {
  final ChatRepository repository;
  FetchMessages(this.repository);

  Future<List<MessageModel>> execute() => repository.fetchMessages();
}
