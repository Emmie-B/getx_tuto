import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tute/ThemeController.dart';
import 'package:getx_tute/views/shoping_screen.dart';

import 'storeControllers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //  theme: Themes.lightTheme,
      // darkTheme: Themes.darkTheme,
      themeMode: themeController.theme,
      // initialBinding: StoreBinding(),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // home: MyCart(),
      home: const ShoppingPage(),
    );
  }
}

class MyHomePage extends GetView<StoreController> {
  final StoreController storeController = Get.put(StoreController());
  // final storeController = Get.find<StoreController>();

  MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(storeController.storeName.value)),
      ),
      body: Column(
        children: [
          TextField(
            controller: storeController.storeNameEditingController,
            onChanged: (value) {
              storeController.storeName(value);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          storeController
              .storeName(storeController.storeNameEditingController.text);

          Get.snackbar("Emmie", storeController.storeName.value,
              messageText: Text(
                storeController.storeName.value,
                style: const TextStyle(color: Colors.green),
              ));

          Get.bottomSheet(
            Container(
              color: Colors.white,
              child: Wrap(
                children: [
                  ListTile(
                    leading: const Icon(Icons.music_note),
                    title: const Text('Music'),
                    onTap: () => {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.videocam),
                    title: const Text('Video'),
                    onTap: () => {},
                  ),
                ],
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
