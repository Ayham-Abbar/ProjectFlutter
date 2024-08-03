import 'package:domestore/Services/api.dart';
import 'package:flutter/material.dart';

class ProductSearch extends SearchDelegate {
  List<String>? cato;
  ProductSearch({required this.cato});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('data');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: cato!.length,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {
                Api.fetchProductsByCategory(
                    '/products/category/', cato![index]);
              },
              child: ListTile(
                title: Center(
                  child: Text(cato![index]),
                ),
              ),
            ),
          );
        });
  }

  Future<List> _getallCatogaries(String path) async {
    List res = await Api.fetchCategories(path);
    return res;
  }
}
