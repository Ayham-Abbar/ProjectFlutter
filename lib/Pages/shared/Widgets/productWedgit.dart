import 'package:domestore/Pages/Cart/Model/cartModel.dart';
import 'package:domestore/Pages/Products/productDetails.dart';
import 'package:domestore/Pages/shared/models/products_response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Productwedgit extends StatelessWidget {
  final Product product;
  final bool isGrad;
  const Productwedgit({super.key, required this.product, this.isGrad = true});

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Cart>(context);
    return InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => ProductDetailsPage(product: product)));
          },
          child: Card(
            child: Column(
              children: [
                Image.network(
                  product.thumbnail,
                  fit: BoxFit.contain,
                  height: isGrad ? null : 200,
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.title),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '  ${product.price.toStringAsFixed(2)}\$',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        IconButton(
                            onPressed: () {
                              model.add(product);
                            },
                            icon: const Icon(
                                Icons.shopping_cart_checkout_rounded))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
    );
  }
}
