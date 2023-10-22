import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?size=626&ext=jpg&ga=GA1.1.386372595.1697932800&semt=ais"),
          ),
        ),
        const SizedBox(width: 10),
        const Text('Hello,\nJohn Doe'),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      ],
    );
  }
}
