import 'package:blur/classes/post_object.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<PostObject>> getPosts() async {
  List<PostObject> output = [];
  FirebaseFirestore db = FirebaseFirestore.instance;

  await db.collection('posts').get().then((value) {
    for (var doc in value.docs) {
      output.add(
        PostObject(
          content: doc.data()['content'],
          createdAt: DateTime.fromMillisecondsSinceEpoch(
            doc.data()['created_at'].seconds * 1000,
          ),
        ),
      );
    }
  });

  return output;
}
