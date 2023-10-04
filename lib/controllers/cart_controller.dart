import 'package:get/get.dart';

import '../models/ApiProducts.dart';

class CartController extends GetxController {
  RxList cart = RxList<Products>();

  int get totalPrice =>
      cart.fold<int>(0, (sum, item) => sum + item.price as int);

  // add to cart
  void addToCart(Products product) {
    if (cart.contains(product)) {
      Get.snackbar("Product Exist", "Product already added to cart");
    } else {
      cart.add(product);
    }
  }

  void emptyCart() {
    cart.clear();
  }
}
