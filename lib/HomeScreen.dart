import 'package:flutter/material.dart';
import './App_drawer.dart';
import './Cart.dart';
import './Providers/Products_providers.dart';
import './Providers/Cart_provider.dart';
import 'package:provider/provider.dart';

List cartItems = [];
List wishList = [];
bool isWishList = false;

class HomeScreen extends StatelessWidget {
  static const routeName = '/HomeScreen';
  @override
  Widget build(BuildContext context) {
    bool showfav = false;
    showfav = ModalRoute.of(context).settings.arguments as bool;
    final productsData = Provider.of<ProductsProvider>(context);
    final cart = Provider.of<CartProvider>(context, listen: false);

    final product = showfav ? productsData.favItems : productsData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Esmart'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, '/Cart');
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Appdrawer(),
      ),
      body: GridView.builder(
        padding: EdgeInsets.only(top: 10),
        itemCount: product.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 8.0),
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            child: Card(
                child: Stack(
              children: [
                GestureDetector(
                    child: Image.network(product[index]['Link']),
                    onTap: () {
                      Navigator.pushNamed(context, '/productOverviewScreen',
                          arguments: product[index]['id']);
                    }),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              icon: Icon(
                                product[index]['fav']
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                productsData.toggleFav(index);
                              }),
                          Text(
                            product[index]['Title'],
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.shopping_cart,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                cart.addItem(
                                    product[index]['id'],
                                    product[index]['Price'],
                                    product[index]['Title'],
                                    product[index]['Link']);
                                Scaffold.of(context).hideCurrentSnackBar();
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Item added to cart!"),
                                  duration: Duration(seconds: 2),
                                  action: SnackBarAction(
                                      label: "Undo",
                                      onPressed: () {
                                        cart.removeSingleItem(
                                            product[index]['id']);
                                      }),
                                ));
                              })
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )),
          );
        },
      ),
    );
  }
}
