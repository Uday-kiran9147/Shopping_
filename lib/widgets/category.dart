import 'package:flutter/material.dart';

class CategoryItems extends StatefulWidget {
  CategoryItems({super.key});

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  String selectedCategory = 'Category 1';
  // Default selected category
  Map<String, List<String>> items = {
    'Category 1': ['Item 1A', 'Item 1B', 'Item 1C'],
    'Category 2': ['Item 2A', 'Item 2B'],
    'Category 3': ['Item 3A', 'Item 3B', 'Item 3C'],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: items.keys.map((category) {
            return GestureDetector(
              onTap: () => {
                setState(() {
                  selectedCategory = category;
                })
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: 20,
                  top: 20,
                  bottom: 20,
                  right: category == items.length - 1 ? 20 : 0,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: selectedCategory == category
                      ? Colors.blue
                      : Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    category,
                    style: TextStyle(
                      color: selectedCategory == category
                          ? Colors.white
                          : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items[selectedCategory]!.length,
            itemBuilder: (context, index) {
              final item = items[selectedCategory]![index];
              return Container(
                margin: EdgeInsets.only(left: 20),
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    item,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
