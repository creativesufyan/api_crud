import 'package:api_crud/screens/add_new_product_screen.dart';
import 'package:flutter/material.dart';

import '../screens/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return ProductActionDialog(context);
            });
      },
      leading: Image.network(
        product.image,
        width: 80,
      ),
      title: Text(product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.productCode),
          Text("TotalPrice: ${product.totalPrice}"),
        ],
      ),
      trailing: Text('\$${product.unitPrice}'),
    );
  }

  AlertDialog ProductActionDialog(BuildContext context) {
    return AlertDialog(
      title: const Text("Select action"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Edit"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddNewProductList()));
            },
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            leading: Icon(Icons.delete_outline),
            title: Text("Delete"),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
