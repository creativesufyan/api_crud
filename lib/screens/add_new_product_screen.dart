import 'package:flutter/material.dart';

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
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Product"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _titleTEController,
                decoration: const InputDecoration(
                    label: Text("Title"), hintText: "Enter product title"),
              ),
              TextFormField(
                controller: _productCodeTEController,
                decoration: const InputDecoration(
                    label: Text("Product Code"),
                    hintText: "Enter product code"),
              ),
              TextFormField(
                controller: _quantityTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text("Quantity"),
                    hintText: "Enter product Quantity"),
              ),
              TextFormField(
                controller: _unitPriceTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text("Unit Price"),
                    hintText: "Enter product unit price"),
              ),
              TextFormField(
                controller: _totalPriceTEController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text("Total Price"),
                    hintText: "Enter product Total Price"),
              ),
              TextFormField(
                maxLines: 5,
                controller: _descriptionTEController,
                decoration: const InputDecoration(
                    label: Text("Description"),
                    hintText: "Enter product description"),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: double.infinity,
                child:
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        textStyle: const TextStyle(
                          fontSize: 18,
                         fontWeight: FontWeight.w600,
                        )
                      ),
                        onPressed: () {},
                        child: const Text("Add")),
              ),
            ],
          ),
        ),
      ),
    );
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
