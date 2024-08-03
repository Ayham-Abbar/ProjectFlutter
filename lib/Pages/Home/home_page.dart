import 'package:domestore/Pages/shared/Widgets/productWedgit.dart';
import 'package:domestore/Pages/shared/layout/layout.dart';
import 'package:domestore/Pages/shared/models/products_response.dart';
import 'package:domestore/Services/product_services.dart';
import 'package:flutter/material.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class HomePage extends StatefulWidget {
  static final ROUTE = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final slider = [
    {
      'title': 'super-luxury',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUwlFiHcv0fT3Q7xgLiFc3yP_YRIVvP2y2nA&s'
    },
    {
      'title': 'Bentley Flying Spur',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdW5vb0cdZXVEqNt34FaiBKwYKNcbNgDd2Qg&s'
    },
    {
      'title': 'Rolls-Royce Ghost',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj2J9gYNtooW-77N83YIVcIqIqf5dp3UZKaQ&s'
    }
  ];
  List<Product>? products;
  bool isLoding = false;
  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayOut(
      title: 'HomePage',
      body: Column(
        children: [
          //slider
          Expanded(
            flex: 3,
            child: InfiniteCarousel.builder(
              itemCount: slider.length,
              itemExtent: MediaQuery.of(context).size.width,
              itemBuilder: (context, index, _) {
                return Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          slider[index]['image']!,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Text(slider[index]['title']!),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
              flex: 7,
              child: isLoding
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      color: const Color.fromARGB(255, 250, 183, 183),
                      alignment: Alignment.center,
                      child: products == null
                          ? const Text(
                              'There Was an error while fetching data from server')
                          : (products!.isEmpty
                              ? const Text(
                                  'There Was an error while fetching data from server')
                              : _productWidget()),
                    )),
        ],
      ),
    );
  }

  Widget _productWidget() {
    return GridView.count(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 3.0),
      childAspectRatio: 0.75,
      crossAxisCount: 2,
      children: products!
          .map((e) => Productwedgit(
                product: e,
              ))
          .toList(),
    );
  }

  Future<void> _init() async {
    setState(() => isLoding = true);
    await Future.delayed(Duration(seconds: 3));
    products = await ProductServices.getMostSellingProduct();
    if (mounted) setState(() => isLoding = false);
  }
}
