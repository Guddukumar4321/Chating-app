import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/fetch_messages.dart';
import 'chat_list_event.dart';
import 'chat_list_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FetchChatDetails fetchChatDetails;

  ChatBloc({required this.fetchChatDetails}) : super(ChatInitial()) {
    on<FetchUsersListEvent>(_fetchChatDetails);
    // on<SendMessageEvent>(_sendMessageChat);
  }

  Future _fetchChatDetails(FetchUsersListEvent event, Emitter<ChatState> emit) async {
    emit(ChatLoading());
    try {
      final messages = await fetchChatDetails.execute();
      emit(ChatLoaded( messages: messages));
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

