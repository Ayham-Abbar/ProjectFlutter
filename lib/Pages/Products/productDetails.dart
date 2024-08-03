import 'package:domestore/Pages/Cart/Model/cartModel.dart';
import 'package:domestore/Pages/shared/layout/layout.dart';
import 'package:domestore/Pages/shared/models/products_response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Cart>(context);
    return LayOut(
      title: widget.product.title,
      body: Container(
        padding: const EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            // header
            Expanded(
              flex: 2,
              child: Image.network(
                widget.product.images[0],
                fit: BoxFit.contain,
              ),
            ),

            // body
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  // desc
                  Text(
                    widget.product.description,
                  ),

                  const SizedBox(height: 25),

                  // price
                  Text(
                    '${widget.product.price.toStringAsFixed(2)}\$',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            // Add To Cart Button
            ElevatedButton(
              onPressed: () {
                model.add(widget.product);
              },
              child: Text('Add To Cart'),
            )
          ],
        ),
      ),
    );
  }
}
