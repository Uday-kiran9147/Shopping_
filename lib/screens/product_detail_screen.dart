// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shopping_ui/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel productModel;
  const ProductDetailScreen({
    Key? key,
    required this.productModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(padding: EdgeInsets.all(8.0), children: [
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(),
                    Text("Details"),
                    Icon(Icons.favorite_border_outlined),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.network(productModel.image)),
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.60,
          ),
          SizedBox(height: 20),
          Text(
            productModel.title,
            maxLines: 2,
            overflow: TextOverflow.visible,
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
          ),
          Text(
            "\$ " + productModel.price.toString(),
            textAlign: TextAlign.end,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(productModel.description,maxLines: 4,overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
              )),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Center(
                child: Text(
                  "Buy now",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
        ]),
      ),
    );
  }
}
