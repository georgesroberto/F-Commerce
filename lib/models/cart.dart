import 'package:flutter/material.dart';

import './product.dart';

class Cart extends ChangeNotifier {
  // List of products
  List<Product> productShop = [
    Product(
        name: 'HP',
        price: '24000',
        imagePath: 'lib/img/hp.png',
        description: 'Get yourself the best'),
    Product(
        name: 'Lenovo',
        price: '18000',
        imagePath: 'lib/img/lenovo.png',
        description: 'Get yourself the best Lenovo'),
    Product(
        name: 'Acer',
        price: '41200',
        imagePath: 'lib/img/acer.png',
        description: 'Get yourself the best Acer'),
    Product(
        name: 'MacBook',
        price: '86000',
        imagePath: 'lib/img/mac.jpeg',
        description: 'Get yourself the best Macbook'),
  ];

  // List items in user cart
  List<Product> userCart = [];

  // Get list of products for salw
  List<Product> getProductList() {
    return productShop;
  }

  // Get cart
  List<Product> getUserCart() {
    return userCart;
  }

  // Add items to cart
  void addItemToCart(Product product) {
    userCart.add(product);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Product product) {
    userCart.remove(product);
    notifyListeners();
  }
}
