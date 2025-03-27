import 'package:chatdemo/core/routes/routes_name.dart';
import 'package:flutter/material.dart';
import '../../views/chat_list_screen.dart';
import '../../views/chat_screen.dart';

class AppRoutes {


  /// ✅ Define Named Routes
  static Map<String, WidgetBuilder> routes = {
    RoutesName.chatList: (context) => UserChatScreen(),
  };

  /// ✅ Handle Dynamic Route with Arguments
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.chatScreen:
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
