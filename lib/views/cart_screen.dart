import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tute/controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.find<CartController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetX<CartController>(
              init: cartController,
              // initState: (_) {},
              builder: (controller) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.cart[index].title!),
                      subtitle: Text(controller.cart[index].description!),
                      trailing: IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          // controller.addCartItem(controller.cart[index]);
                        },
                      ),
                    );
                  },
                  itemCount: controller.cart.length,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cartController.emptyCart();
        },
        child: const Icon(Icons.clear_all),
      ),
    );
  }
}
