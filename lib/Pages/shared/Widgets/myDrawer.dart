import 'package:domestore/Pages/Products/productPage.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj2J9gYNtooW-77N83YIVcIqIqf5dp3UZKaQ&s'))
                  ,
                  ListTile(leading:const Icon(Icons.shopping_cart) ,title:const Text('Product Page'),onTap: () => Navigator.of(context).pushNamed(Productpage.ROUTE)),
        ],
      ),
    );
  }
}
