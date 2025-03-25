
import '../../data/models/chat_model.dart';
import '../../data/repositories/chat_repository.dart';

class FetchChatDetails {
  final ChatRepository repository;
  FetchChatDetails(this.repository);

  Future<ChatModel> execute() => repository.fetchChatDetails();
}
