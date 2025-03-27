import 'package:chatdemo/viewModels/bloc/chat_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/routes_name.dart';
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
        initialRoute: RoutesName.chatList,
        routes: AppRoutes.routes, // Use static routes
        onGenerateRoute: AppRoutes.generateRoute,

      ),
    );
  }
}
