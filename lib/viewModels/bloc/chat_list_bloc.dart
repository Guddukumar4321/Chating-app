import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/fetch_messages.dart';
import 'chat_list_event.dart';
import 'chat_list_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FetchChatDetails fetchChatDetails;

  ChatBloc({required this.fetchChatDetails}) : super(ChatInitial()) {
    on<FetchUsersListEvent>(_fetchChatDetails);
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

}

