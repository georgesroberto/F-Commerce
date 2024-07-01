import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero/models/cart.dart';
import 'package:zero/models/product.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  Product product;
  CartItem({
    super.key,
    required this.product,
  });

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // Remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false)
        .removeItemFromCart(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(widget.product.imagePath),
        title: Text(widget.product.name),
        subtitle: Text(widget.product.price),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
