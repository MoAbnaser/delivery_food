import 'package:flutter/material.dart';
import 'package:food_delivery/logic/controllers/cart_controller.dart';
import 'package:food_delivery/logic/controllers/recommended_product_controller.dart';
import 'package:food_delivery/logic/controllers/popular_product_controller.dart';
import 'package:food_delivery/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:food_delivery/logic/helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    Get.find<CartController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery',
      initialRoute: AppRoutes.getSplashScreen(),
      getPages: AppRoutes.routes,
    );
  }
}
