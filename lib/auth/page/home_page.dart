import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String message;
  const HomePage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Text(message));
  }
}
