import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/cart/screen/cart.dart';
import 'components/dashboard/screen/dashboard.dart';
import 'components/login/screen/login.dart';
import 'components/p_details/screen/product_details_screen.dart';
import 'components/screens/splash/screen/splesh.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/dashboard', page: () => DashboardScreen()),
        GetPage(name: '/product', page: () => ProductDetailsScreen()),
        GetPage(name: '/cart', page: () => CartScreen()),
      ],
    );
  }
}
