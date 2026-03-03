import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Theme.of(context).colorScheme.surfaceContainer,
              child: Column(children: [Text("23/09/2009")]),
            ),
          ],
        ),
      ),
    );
  }
}
