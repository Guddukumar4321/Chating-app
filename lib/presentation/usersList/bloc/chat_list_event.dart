abstract class ChatEvent {}

class FetchMessagesEvent extends ChatEvent {}

class FetchUsersListEvent extends ChatEvent {}

class FetchChatDetailsEvent extends ChatEvent {}

class SendMessageEvent extends ChatEvent {
  final String message;
  final int userId;
  SendMessageEvent(this.message, this.userId);
}
