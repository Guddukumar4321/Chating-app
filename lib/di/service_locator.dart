import 'package:get_it/get_it.dart';
import '../core/services/chat_service.dart';
import '../domain/usecases/fetch_messages.dart';
import '../repositories/chat_repository.dart';
import '../viewModels/bloc/chat_list_bloc.dart';


final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => ChatService());
  locator.registerLazySingleton(() => ChatRepository(locator()));
  locator.registerLazySingleton(() => FetchChatDetails(locator()));
  locator.registerFactory(() => ChatBloc(fetchChatDetails: locator()));
}
