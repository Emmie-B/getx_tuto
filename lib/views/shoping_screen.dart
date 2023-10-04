import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tute/views/cart_screen.dart';
import 'package:getx_tute/views/detail_screen.dart';

import '../controllers/cart_controller.dart';
import '../controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ShoppingController shoppingController = Get.put(ShoppingController());
    final CartController cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(
              init: shoppingController,
              // initState: (_) {},
              builder: (controller) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      // onTap: controller.seeDetail(controller.products[index])
                      onTap: () {
                        Get.to(() => const DetailScreen(), arguments: {
                          'detailProduct': controller.products[index],
                        });
                      },
                      title: Text(controller.products[index].title!),
                      subtitle: Text(controller.products[index].description!),
                      trailing: IconButton(
                        icon: const Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          // controller.addCartItem(controller.products[index]);
                          cartController.addToCart(controller.products[index]);
                        },
                      ),
                    );
                  },
                  itemCount: controller.products.length,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(() => const CartScreen());
        },
        label: Obx(() => Text('Total Price: ${cartController.totalPrice}')),
        // Text('Cart Item:  ${cartController.cart.length.toString()}'))),
      ),
    );
  }
}
