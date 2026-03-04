import 'package:blur/classes/post_object.dart';
import 'package:blur/methods/get_posts.dart';
import 'package:blur/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PostObject>> getPostsFuture;

  @override
  void initState() {
    super.initState();
    getPostsFuture = getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "blur",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                getPostsFuture = getPosts();
                debugPrint("Here");
              });
            },
            icon: Icon(
              Icons.replay,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.push('/create-post');
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Theme.of(context).colorScheme.onSurface),
        ),
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: getPostsFuture,
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  spacing: 16,
                  children: List.generate(
                    asyncSnapshot.data!.length,
                    (index) => Post(
                      postObject: PostObject(
                        createdAt: asyncSnapshot.data![index].createdAt,
                        content: asyncSnapshot.data![index].content,
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            );
          }
        },
      ),
    );
  }
}
