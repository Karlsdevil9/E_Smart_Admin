import 'package:flutter/material.dart';
import './LoginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import './Providers/Products_providers.dart';
import './ProductOverviewScreen.dart';
import './HomeScreen.dart';
import './Providers/Cart_provider.dart';
import './Cart.dart';
import './Providers/Orders.dart';
import './OrdersScreen.dart';
import './Admin_products_screen.dart';
import './Edit_Product_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'Esmart',
        home: LoginScreen(),
        routes: {
          '/login': (context) => LoginScreen(),
          ProductOverviewScreen.routeName: (context) => ProductOverviewScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          Cart.routeName: (context) => Cart(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
          AdminProductScreen.routeName: (context) => AdminProductScreen(),
          EditProductScreen.routeName: (context) => EditProductScreen(),
        },
      ),
    );
  }
}
