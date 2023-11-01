import 'package:api_crud/screens/add_new_product_screen.dart';
import 'package:api_crud/widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product List"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddNewProductList()),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.separated(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ProductItem();
          },
          separatorBuilder: (context, index) =>const Divider(),
        ));
  }
}
