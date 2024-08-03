import 'package:domestore/Pages/Cart/Model/cartModel.dart';
import 'package:domestore/Pages/Cart/Pages/Cart.dart';
import 'package:domestore/Pages/shared/layout/search.dart';
import 'package:domestore/Services/api.dart';
import 'package:flutter/material.dart';
import 'package:domestore/Pages/shared/Widgets/myDrawer.dart';
import 'package:provider/provider.dart';

class LayOut extends StatefulWidget {
  final String title;
  final Widget body;

  const LayOut({super.key, required this.title, required this.body});

  @override
  State<LayOut> createState() => _LayOutState();
}

class _LayOutState extends State<LayOut> {
  List<String> categories = [];
  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    // List l1 = _getallCatogaries('/products/category-list') as List;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // إزالة الظل لإعطاء مظهر مسطح
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black, // لون النص أسود كما في التصميم
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black), // لون الأيقونات أسود
        actions: [
          Row(
            children: [
              // IconButton(
              //   icon: Icon(Icons.search),
              //   onPressed: () {
              //     _getallCatogaries('/products/category-list');
              //   },
              // ),
              //   DropdownButton<String>(items: l1.map((item)=>DropdownMenuItem(value: item,child: Text(item))).toList(),
              //  onChanged: (item)=>setState(()=>select);,
              //   ),
              IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: ProductSearch(cato: categories));
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CheckOut()));
                  },
                  icon: const Icon(Icons.shopping_cart)),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Consumer<Cart>(
                  builder: (context, cart, child) => Text('${cart.count}'),
                ),
              ),
            ],
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: widget.body,
    );
  }

  void _loadCategories() async {
    // انتظار جلب البيانات من API ثم تخزينها في قائمة
    final result = await Api.fetchCategories('/products/category-list');
    setState(() {
      categories = List<String>.from(result);
    });
  }
}
