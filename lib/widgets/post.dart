import 'package:blur/classes/post_object.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Post extends StatelessWidget {
  const Post({super.key, required this.postObject});

  final PostObject postObject;

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
            "${DateFormat.yMd('en_IN').format(postObject.createdAt)} ${DateFormat.jm().format(postObject.createdAt)}",
            style: TextStyle(fontSize: 16, color: Color.fromARGB(104, 1, 1, 0)),
          ),
          SelectableText(postObject.content, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
