import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductList extends StatefulWidget {
  const AddNewProductList({super.key});

  @override
  State<AddNewProductList> createState() => _AddNewProductListState();
}

class _AddNewProductListState extends State<AddNewProductList> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _imageTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool addInProgress = false;

  Future<void> addNewProduct() async {
    addInProgress = true;
    setState(() {});
    final Map<String, String> inputMap = {
      "Img": _imageTEController.text.trim(),
      "ProductCode": _productCodeTEController.text.trim(),
      "ProductName": _titleTEController.text.trim(),
      "Qty": _quantityTEController.text.trim(),
      "TotalPrice": _totalPriceTEController.text.trim(),
      "UnitPrice": _unitPriceTEController.text.trim()
    };

    print(inputMap);

    final Response response = await post(
        Uri.parse('https://crud.teamrabbil.com/api/v1/CreateProduct'),
        headers: {'Content-Type': 'Application/json'},
        body: jsonEncode(inputMap));
    addInProgress = false;

    if (response.statusCode == 200) {
      _unitPriceTEController.clear();
      _titleTEController.clear();
      _totalPriceTEController.clear();
      _productCodeTEController.clear();
      _quantityTEController.clear();
      _imageTEController.clear();
      _descriptionTEController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Product Has been added")),
      );
    } else if (response.statusCode == 400) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Product Code Should be unique")),
      );
    }

    setState(() {});
    print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _titleTEController,
                  decoration: const InputDecoration(
                      label: Text("Title"), hintText: "Enter product title"),
                  validator: isValidate,
                ),
                TextFormField(
                  controller: _productCodeTEController,
                  decoration: const InputDecoration(
                      label: Text("Product Code"),
                      hintText: "Enter product code"),
                  validator: isValidate,
                ),
                TextFormField(
                  controller: _imageTEController,
                  decoration: const InputDecoration(
                      label: Text("Image"), hintText: "Enter product Image"),
                  validator: isValidate,
                ),
                TextFormField(
                  controller: _quantityTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Quantity"),
                      hintText: "Enter product Quantity"),
                  validator: isValidate,
                ),
                TextFormField(
                  controller: _unitPriceTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Unit Price"),
                      hintText: "Enter product unit price"),
                  validator: isValidate,
                ),
                TextFormField(
                  controller: _totalPriceTEController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      label: Text("Total Price"),
                      hintText: "Enter product Total Price"),
                  validator: isValidate,
                ),
                TextFormField(
                  maxLines: 5,
                  controller: _descriptionTEController,
                  decoration: const InputDecoration(
                      label: Text("Description"),
                      hintText: "Enter product description"),
                  validator: isValidate,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: addInProgress
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              textStyle: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              )),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              addNewProduct();
                            }
                          },
                          child: const Text("Add")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? isValidate(String? value) {
    if (value?.trim().isNotEmpty ?? false) {
      return null;
    }
    return "Enter valid value";
  }

  @override
  void dispose() {
    _totalPriceTEController.dispose();
    _unitPriceTEController.dispose();
    _productCodeTEController.dispose();
    _quantityTEController.dispose();
    _descriptionTEController.dispose();
    _titleTEController.dispose();
    super.dispose();
  }
}
