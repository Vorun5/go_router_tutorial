import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_route_tutorial/cubits/login_cubit.dart';
import 'package:go_route_tutorial/models/category_model.dart';
import 'package:go_router/go_router.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Category.categorys;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<LoginCubit>().logout();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(categories[index].name),
          onTap: () {
            return context.go(
              context.namedLocation('product_list', params: <String, String>{
                'category': categories[index].name,
              }, queryParams: <String, String>{
                'sort': 'desc',
                'filter': '10',
              }),
            );
          },
        ),
      ),
    );
  }
}
