import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController contentController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          lines[Random().nextInt(lines.length)],
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Form(
            key: formKey,
            child: Column(
              spacing: 8,
              children: [
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter something.';
                    }

                    return null;
                  },
                  controller: contentController,
                  decoration: InputDecoration(
                    fillColor: Theme.of(context).colorScheme.surfaceContainer,
                    filled: true,
                    hintText: "whats up",
                    hintStyle: TextStyle(color: Color.fromARGB(104, 1, 1, 0)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) {
                        return;
                      }

                      if (contentController.text.toLowerCase().contains(
                        "epstein",
                      )) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                "This is the only exception to free speech.",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );

                        return;
                      }

                      setState(() {
                        loading = true;
                      });

                      FirebaseFirestore db = FirebaseFirestore.instance;

                      await db.collection('posts').add({
                        'content': contentController.text,
                        'created_at': DateTime.now(),
                      });

                      if (context.mounted) {
                        context.pop();
                      }

                      setState(() {
                        loading = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: BeveledRectangleBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                    child: loading
                        ? CircularProgressIndicator(
                            color: Theme.of(context).colorScheme.onSurface,
                            padding: EdgeInsets.all(8),
                          )
                        : Text(
                            "Post",
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<String> lines = [
  "what's up?",
  "what's on your mind?",
  "something going on?",
];
