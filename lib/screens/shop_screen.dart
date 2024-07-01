import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero/models/product.dart';
import '../components/product_tile.dart';
import '../models/cart.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  // Add shoe to cart
  void addProductToCart(Product product) {
    Provider.of<Cart>(context, listen: false).addItemToCart(product);

    // Alert user on successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text('Succesfully Added'),
        content: Text('Check your cart'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(0),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                )
              ],
            ),
          ),

          // Message
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
            child: Text(
              'We all have machines but the developers recommend laapy tops',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),

          // Hot Picks
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hottest Laptops 🔥 ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                Text(
                  'See all',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                )
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Items
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // Get a product
                Product product = value.getProductList()[index];

                // Return product
                return ProductTile(
                  product: product,
                  onTap: () => addProductToCart(product),
                );
              },
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
            child: Divider(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
