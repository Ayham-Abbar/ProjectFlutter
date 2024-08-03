import 'package:flutter/material.dart';
import 'package:domestore/Pages/shared/models/products_response.dart';

class MyWidget extends StatelessWidget {
  final Product product;
  const MyWidget({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Image.network(product.images[0]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(product.title),
          Text(product.price.toStringAsFixed(2))
        ],)],
      ),
    );
  }
}
