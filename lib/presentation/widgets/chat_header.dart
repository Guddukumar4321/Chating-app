import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  ChatHeader({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
    );
  }
}
