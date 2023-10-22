
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // expandedHeight: 300,
      actions: [
        CircleAvatar(),
        SizedBox(width: 10),
        Text('Hello,\nJohn Doe'),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
        IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ],
    );
  }
}
