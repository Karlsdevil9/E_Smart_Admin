import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Providers/Cart_provider.dart';
import './Providers/Orders.dart';

class Cart extends StatelessWidget {
  static const routeName = '/Cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    Future<bool> show() {
      return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text(
            'Do you want to remove the item from the cart?',
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(ctx).pop(false);
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(ctx).pop(true);
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Cart"),
        ),
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Total Amount : ${cart.totalAmount}"),
              RaisedButton(
                child: Text("Place Order"),
                onPressed: () {
                  Provider.of<Orders>(context, listen: false)
                      .addOrder(cart.items.values.toList(), cart.totalAmount);
                  cart.clear();
                },
              )
            ],
          ),
        ),
        body: ListView.builder(
          itemCount: cart.itemCount,
          itemBuilder: (context, index) {
            return Dismissible(
              key: ValueKey(cart.items.keys.toList()[index]),
              background: Container(
                color: Colors.red,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 40,
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 4,
                ),
              ),
              direction: DismissDirection.endToStart,
              confirmDismiss: (direction) {
                return show();
              },
              onDismissed: (direction) {
                cart.removeItem(cart.items.keys.toList()[index]);
              },
              child: Card(
                child: ListTile(
                  leading: Container(
                    height: MediaQuery.of(context).size.height,
                    width: 100,
                    child: Image.network(cart.items.values.toList()[index].img),
                  ),
                  title: Text(cart.items.values.toList()[index].title),
                  subtitle: Text(
                      "Quantity : ${cart.items.values.toList()[index].quantity.toString()}"),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        Text((cart.items.values.toList()[index].price)
                            .toString()),
                        IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () async {
                              bool sho = await show();
                              if (sho) {
                                cart.removeItem(
                                    cart.items.keys.toList()[index]);
                              }
                            })
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
