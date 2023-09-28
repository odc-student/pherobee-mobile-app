import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key, required this.text, this.id});
  final String text;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(text),
            if(id!=null)Text(id!),
          ],
        ),
      ),
    );
  }
}
