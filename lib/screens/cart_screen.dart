import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero/components/cart_item.dart';
import 'package:zero/models/cart.dart';
import 'package:zero/models/product.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  // Get individual product
                  Product individualProduct = value.getUserCart()[index];

                  // Return cart item
                  return CartItem(
                    product: individualProduct,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
