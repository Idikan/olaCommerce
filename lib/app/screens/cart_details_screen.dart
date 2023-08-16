import 'package:flutter/material.dart';

class CartDetailsScreen extends StatefulWidget {
  const CartDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CartDetailsScreen> createState() => _CartDetailsScreenState();
}

class _CartDetailsScreenState extends State<CartDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        centerTitle: true,
      ),

    );
  }
}
