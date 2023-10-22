import 'package:flutter/material.dart';

class CategotyHeader extends StatelessWidget {
  const CategotyHeader({
    Key? key,
    required this.category,
    this.ontap,
  }) : super(key: key);

  final String category;
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
          Text(
            category,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          ActionChip(
            label: Text("See all"),
            onPressed: ontap,
          ),
        ],
      ),
    );
  }
}
