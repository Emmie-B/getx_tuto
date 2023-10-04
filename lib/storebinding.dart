import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

import 'storeControllers.dart';

class StoreBinding implements Bindings {
// default dependency
 @override
 void dependencies() {
   Get.lazyPut(() => StoreController());
 }
}