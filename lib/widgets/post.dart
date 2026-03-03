import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Post extends StatelessWidget {
  const Post({super.key, required this.dateTime, required this.content});

  final DateTime dateTime;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
        border: BoxBorder.all(color: Theme.of(context).colorScheme.onSurface),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          Text(
            "${DateFormat.yMd('en_IN').format(dateTime)} ${DateFormat.jm().format(dateTime)}",
            style: TextStyle(fontSize: 16, color: Color.fromARGB(104, 1, 1, 0)),
          ),
          Text(content, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
