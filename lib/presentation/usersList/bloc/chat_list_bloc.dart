import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/value/user_data.dart';
import '../../../domain/usecases/fetch_chat_details.dart';
import '../../../domain/usecases/fetch_messages.dart';
import 'chat_list_event.dart';
import 'chat_list_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FetchChatDetails fetchChatDetails;
  final FetchMessages fetchMessages;

  ChatBloc({required this.fetchChatDetails, required this.fetchMessages}) : super(ChatInitial()) {
    on<FetchUsersListEvent>(_fetchChatDetails);
    // on<SendMessageEvent>(_sendMessageChat);
  }

  Future _fetchChatDetails(FetchUsersListEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    try {
      final chat = await fetchChatDetails.execute();
      final messages = await fetchMessages.execute();
      emit(ChatLoaded(chat: chat, messages: messages));
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }



  // Future<void> _sendMessageChat(SendMessageEvent event, Emitter<ChatState> emit) async {
  //  try{
  //    if (event.message.isNotEmpty) {
  //      var userIndex = usersData.indexWhere((user) => user["user_id"] == event.userId);
  //
  //      if (userIndex != -1) {
  //        usersData[userIndex]["chats"].add({
  //          "id": event.userId.toString(), // Unique ID
  //          "message": event.message
  //        });
  //
  //        print("✅ Message added successfully to user_id 2!");
  //      } else {
  //        print("Error: User not found!");
  //      }
  //
  //      // Fetch updated data
  //      final chat = await fetchChatDetails.execute();
  //      final messages = await fetchMessages.execute();
  //
  //      // ✅ Emit updated chat state
  //      emit(ChatLoaded(chat: chat, messages: List.from(messages)));
  //    }
  //  }catch(e){
  //    print("some thing went wrong :: $e");
  //  }
  // }

}



















// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../data/models/chat_model.dart';
// import '../../../data/models/message_model.dart';
// import '../../../domain/usecases/fetch_chat_details.dart';
// import '../../../domain/usecases/fetch_messages.dart';
// import 'chat_list_event.dart';
// import 'chat_list_state.dart';
//
//
// class ChatBloc extends Bloc<ChatEvent, ChatState> {
//   final FetchChatDetails fetchChatDetails;
//   final FetchMessages fetchMessages;
//
//    List<MessageModel> _messages = [
//     MessageModel(sender: "Aarav", text: "Hey! How are you?"),
//     MessageModel(sender: "Me", text: "I'm good, thanks! How about you?"),
//     MessageModel(sender: "Aarav", text: "Just chilling, watching a movie."),
//     MessageModel(sender: "Me", text: "Nice! Which movie?"),
//   ];
//
//
//   ChatBloc({required this.fetchChatDetails, required this.fetchMessages}) : super(ChatInitial()) {
//     on<FetchChatDetailsEvent>(fetchUsersList);
//     on<FetchChatDetailsEvent>(fetchUserChat);
//     on<SendMessageEvent>(SendMessageChat);
//
//   }
//
//   Future<void> fetchUsersList( event, Emitter emit) async {
//     emit(ChatLoading());
//     try {
//       final chat = await fetchChatDetails.execute();
//       final messages = await fetchMessages.execute();
//       emit(ChatLoaded(chat: chat, messages: messages));
//     } catch (e) {
//       emit(ChatError(e.toString()));
//     }
//   }
//
//   Future<void> fetchUserChat(event, emit) async {
//     emit(ChatLoading());
//     try {
//       final chat = await fetchChatDetails.execute();
//       final messages = await fetchMessages.execute();
//       emit(ChatLoaded(chat: chat, messages: messages));
//     } catch (e) {
//       emit(ChatError(e.toString()));
//     }
//   }
//
//   Future<void> SendMessageChat(event, emit) async {
//     if (event.message.isNotEmpty) {
//       _messages.add(MessageModel(sender: "Me", text: event.message));
//       emit(ChatLoaded(chat: ChatModel(), messages: List.from(_messages))); // Update UI
//     }
//   }
// }
