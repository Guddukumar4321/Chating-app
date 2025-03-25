import 'package:flutter/material.dart';
import '../../presentation/usersList/screens/chat_list_screen.dart';
import '../../presentation/usersList/screens/chat_screen.dart';

class AppRoutes {
  static const String chatList = '/';
  static const String chatScreen = '/chatScreen';

  /// ✅ Define Named Routes
  static Map<String, WidgetBuilder> routes = {
    chatList: (context) => UserChatScreen(),
  };

  /// ✅ Handle Dynamic Route with Arguments
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case chatScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => ChatScreen(user: args["user"]),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('🚫 Route Not Found: ${settings.name}')),
          ),
        );
    }
  }
}
