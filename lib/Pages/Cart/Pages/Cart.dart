import 'package:domestore/Pages/Cart/Model/cartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CheckOut'),
          backgroundColor: Color.fromARGB(255, 66, 165, 168),
        ),
        body: ListCheckOut());
  }
}

class ListCheckOut extends StatelessWidget {
  const ListCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Cart>(context);
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: ListView.builder(
              itemCount: model.bascketItems.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(model.bascketItems[index].thumbnail),
                    title: Text(
                        '${model.bascketItems[index].title}    ${model.bascketItems[index].price} '),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        model.remove(model.bascketItems[index]);
                      },
                    ),
                  ),
                );
              }),
        ),
        Expanded(
            child: InkWell(
          onTap: () {
            model.removeAll();
          },
          child: Container(
            width: double.infinity,
            color: const Color.fromARGB(255, 1, 173, 122),
            child: const Center(
                child: const Text(
              'Add To Cart',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        ))
      ],
    );
  }
}
