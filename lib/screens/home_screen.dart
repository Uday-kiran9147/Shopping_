// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopping_ui/providers/provider.dart';
import 'package:shopping_ui/screens/all_products.dart';
import 'package:shopping_ui/widgets/appbar.dart';
import 'package:shopping_ui/widgets/category.dart';
import 'package:shopping_ui/widgets/product_tile.dart';

import '../widgets/category_header.dart';
import '../widgets/searchbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Provider.of<AppProvider>(context, listen: false).getProducts();
    Provider.of<AppProvider>(context, listen: false).getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appstate = Provider.of<AppProvider>(context);
    return Scaffold(
      body: appstate.products == null
          ? const CircularProgressIndicator()
          : CustomScrollView(
              slivers: [
                const AppBarWidget(),
                const SliverToBoxAdapter(
                  // create a text field for searching products
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFieldCustom(),
                  ),
                ),
                // create a container to show latest deals and offers
                const SliverToBoxAdapter(
                  child: BannerWIdget(),
                ),
                const SliverToBoxAdapter(
                    child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CategoryItems(),
                )),
                SliverToBoxAdapter(
                    child: CategotyHeader(
                  category: "All Products",
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ViewAllProducts(),
                        ));
                  },
                )),

                SliverToBoxAdapter(
                    child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: appstate.products!.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                          productModel: appstate.products![index]);
                    },
                  ),
                )),
              ],
            ),
    );
  }
}

class BannerWIdget extends StatelessWidget {
  const BannerWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: 200,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 223, 199, 145),
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: NetworkImage("https://i.imgur.com/uDpzwEk.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
