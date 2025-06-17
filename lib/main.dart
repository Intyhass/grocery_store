import 'package:flutter/material.dart';
import 'package:grocery_store/models/cart_model.dart';
import 'package:grocery_store/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(debugShowMaterialGrid: false, home: IntroPage()),
    );
  }
}
