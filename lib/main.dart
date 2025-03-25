
import 'package:chatdemo/presentation/usersList/bloc/chat_list_bloc.dart';
import 'package:chatdemo/presentation/usersList/screens/chat_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/app_routes.dart';
import 'di/service_locator.dart';


void main() {
  /// Initialize dependency injection
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<ChatBloc>(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ChatBloc',
        initialRoute: AppRoutes.chatList,
        routes: AppRoutes.routes, // Use static routes
        onGenerateRoute: AppRoutes.generateRoute,

      ),
    );
  }
}
