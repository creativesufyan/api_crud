import 'package:api_crud/screens/product_list_screen.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(CrudApp());
}

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:ProductListScreen(),
    );
  }
}
