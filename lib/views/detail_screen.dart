import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tute/models/ApiProducts.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Products product = Get.arguments['detailProduct'];
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title ?? "Detail"),
      ),
      body: Column(
        children: [
          Text(product.title ?? "Geeess"),
          const Center(
            child: Text('Cart Screen'),
          ),
          Image.network(product.images!.first)
        ],
      ),
    );
  }
}
