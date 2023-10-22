import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_ui/providers/provider.dart';
import 'package:shopping_ui/widgets/product_tile.dart';

class ViewAllProducts extends StatelessWidget {
  const ViewAllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<AppProvider>(context).products;
    return Scaffold(
        appBar: AppBar(
          title: const Text("All Products"),
        ),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: productList!.length,
          itemBuilder: (context, index) {
            return ProductTile(
              productModel: productList[index],
            );
          },
        ));
  }
}
