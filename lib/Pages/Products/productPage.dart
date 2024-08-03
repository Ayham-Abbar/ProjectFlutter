import 'package:flutter/material.dart';
import 'package:domestore/Pages/shared/Widgets/productWedgit.dart';
import 'package:domestore/Pages/shared/layout/layout.dart';
import 'package:domestore/Pages/shared/models/products_response.dart';
import 'package:domestore/Services/product_services.dart';

class Productpage extends StatefulWidget {
  static final ROUTE = '/Productpage';

  const Productpage({super.key});

  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
  @override
  void initState() {
    _init();
    super.initState();
  }

  bool isLoding = false;
  List<Product>? products;

  @override
  Widget build(BuildContext context) {
    return LayOut(
        title: 'ProductPage',
        body: isLoding
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                color: Colors.white,
                alignment: Alignment.center,
                child: products == null
                    ? const Text(
                        'There Was an error while fetching data from server')
                    : (products!.isEmpty
                        ? const Text(
                            'No products found.')
                        : _productWidget()),
              ));
  }

  Future<void> _init() async {
    setState(() => isLoding = true);
    products = (await ProductServices.getAllProduct());
    if (mounted) setState(() => isLoding = false);
  }

  Widget _productWidget() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
      itemCount: products!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7, // لضبط نسبة العرض إلى الارتفاع للعناصر
        mainAxisSpacing: 15.0, // المسافة الرأسية بين العناصر
        crossAxisSpacing: 15.0, // المسافة الأفقية بين العناصر
      ),
      itemBuilder: (context, index) {
        final product = products![index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Productwedgit(
            product: product,
          ),
        );
      },
    );
  }
}
