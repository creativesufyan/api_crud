import 'package:api_crud/screens/add_new_product_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

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
        "https://www.vibrantbd.com/cdn/shop/files/2510113_5_300x.jpg?v=1697026185",
        width: 80,
      ),
      title: const Text("Product Name"),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Product Code"),
              SizedBox(width: 24,),
              Text("Product Price"),
            ],
          ),
          Text("Product Description")
        ],
      ),
      trailing: const Text("\$120"),
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
