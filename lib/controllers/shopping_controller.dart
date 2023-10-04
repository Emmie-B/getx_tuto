import 'package:get/get.dart';
import 'package:getx_tute/models/ApiProducts.dart';
// import '../models/product.dart';
import '../services/product_services.dart';

ProductServices? productService;

class ShoppingController extends GetxController {
  RxList<Products> products = RxList<Products>();
  RxList<Products> cart = RxList<Products>();
  final totalAmount = 0.obs;
  final cartItemCount = 0.obs;

  void addCartItem(Products product) {
    // cartItemCount.value++;
    cart.add(products[0]);
  }

  seeDetail(Products product) {
    
  }

  @override
  void onInit() {
    super.onInit();
    productService = ProductServices();
    fetchProducts();
  }

  fetchProducts() async {
    await productService!.getProducts().then((data) {
      if (data != null) {
        products.value = data;
      } else {
        // show error message
        Get.snackbar('Error', 'Error -getProducts- ProductServices');
      }
    });
  }
}
