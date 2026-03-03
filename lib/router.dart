import 'package:blur/pages/create_post_page.dart';
import 'package:blur/pages/home_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomePage()),
    GoRoute(
      path: '/create-post',
      builder: (context, state) => CreatePostPage(),
    ),
  ],
);
