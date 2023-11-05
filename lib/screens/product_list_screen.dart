import 'dart:convert';
import 'package:api_crud/screens/add_new_product_screen.dart';
import 'package:api_crud/screens/product.dart';
import 'package:api_crud/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool inProgress = false;
  @override
  void initState() {
    getProductList();
    super.initState();
  }

  void getProductList() async {
    inProgress = true;
    setState(() {});
    Response response = await get(
      Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct"),
    );
    if (response.statusCode == 200) {
      productList.clear();
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success') {
        for (Map<String, dynamic> productJson in responseData['data']) {
          productList.add(Product(
            productJson['_id'] ?? '',
            productJson['ProductName'] ?? '',
            productJson['ProductCode'] ?? '',
            productJson['Img'] ?? '',
            productJson['UnitPrice'] ?? '',
            productJson['Qty'] ?? '',
            productJson['TotalPrice'] ?? '',
          ));
        }
      }
    } else {
    }
    inProgress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product List"),
          actions: [
            IconButton(onPressed: (){
              getProductList();
            }, icon: const Icon(Icons.refresh)),
          ],
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
        body: inProgress
            ? const Center(child: CircularProgressIndicator(),)
            : ListView.separated(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: productList[index],
                  );
                },
                separatorBuilder: (_, __) => const Divider(),
              ));
  }
}
