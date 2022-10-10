import 'package:flutter/material.dart';
import 'package:go_route_tutorial/models/product_model.dart';
import 'package:go_router/go_router.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen(
      {Key? key,
      required this.category,
      required this.asc,
      required this.quantity})
      : super(key: key);

  final String category;
  final bool asc;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final products = Product.products
        .where((e) => e.category == category)
        .where((e) => e.quantity > quantity)
        .toList();

    products.sort(((a, b) => a.name.compareTo(b.name)));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product list'),
        actions: [
          IconButton(
            onPressed: () {
              String sort = asc ? 'desc' : 'asc';
              return context.goNamed(
                'product_list',
                params: <String, String>{'category': category},
                queryParams: <String, String>{
                  'sort': sort,
                  'filter': quantity.toString(),
                },
              );
            },
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          for (final product in asc ? products : products.reversed)
            ListTile(title: Text(product.name))
        ],
      ),
    );
  }
}
