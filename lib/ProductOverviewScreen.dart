import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Providers/Products_providers.dart';

class ProductOverviewScreen extends StatelessWidget {
  static const routeName = '/productOverviewScreen';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final product = Provider.of<ProductsProvider>(context, listen: false)
        .findById(productId);

    return Scaffold(
      appBar: AppBar(title: Text("Esmart")),
      body: Column(
        children: [
          Container(
            height: 300,
            child: Image.network(product.imageUrl),
          )
        ],
      ),
    );
  }
}
