import 'package:domestore/Pages/Cart/Model/cartModel.dart';
import 'package:domestore/Pages/Home/home_page.dart';
import 'package:domestore/Pages/Products/productPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child:  SafeArea(
      child: MaterialApp(
        initialRoute:HomePage.ROUTE,
        routes: 
        {
          HomePage.ROUTE:(context)=>const HomePage(),
          Productpage.ROUTE:(context)=>const Productpage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    ));
  }
}

