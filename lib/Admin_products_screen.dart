import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Providers/Products_providers.dart';
import './App_drawer.dart';
import './Edit_Product_Screen.dart';

class AdminProductScreen extends StatelessWidget {
  static const routeName = '/Admin-products';

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    final productsData = Provider.of<ProductsProvider>(context);
    final List<Product> product = productsData.items;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: Appdrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_, i) => Column(
            children: [
              ListTile(
                title: Text(product[i].title),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(product[i].imageUrl),
                ),
                trailing: Container(
                  width: 100,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              EditProductScreen.routeName,
                              arguments: product[i].id);
                        },
                        color: Theme.of(context).primaryColor,
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          try {
                            await Provider.of<ProductsProvider>(context,
                                    listen: false)
                                .deleteProduct(product[i].id);
                          } catch (error) {
                            scaffold.showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Deleting failed!',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                        },
                        color: Theme.of(context).errorColor,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
