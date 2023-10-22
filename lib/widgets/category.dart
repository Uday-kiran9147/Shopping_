import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_ui/providers/provider.dart';
import 'package:shopping_ui/widgets/product_tile.dart';

class CategoryItems extends StatefulWidget {
  CategoryItems({super.key});

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  String selectedCategory = 'electronics';

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<AppProvider>(context).categories;
    return Column(
      // shrinkWrap: true,
      children: [
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => {
                  setState(() {
                    selectedCategory = categories[index];
                  })
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 20,
                    bottom: 20,
                    right: categories[index] == categories.length - 1 ? 20 : 0,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: selectedCategory == categories[index]
                        ? Colors.black
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      categories[index],
                      style: TextStyle(
                        color: selectedCategory == categories[index]
                            ? Colors.white
                            : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final currentCategory =
                  Provider.of<AppProvider>(context, listen: false)
                      .products!
                      .where((element) => element.category == selectedCategory)
                      .toList();
              if (currentCategory.isEmpty) {
                return Center(child: CircularProgressIndicator());
              } else {
                return ProductTile(
                  productModel: currentCategory[index],
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
