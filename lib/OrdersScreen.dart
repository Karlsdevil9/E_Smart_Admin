import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import './Providers/Orders.dart';
import 'package:intl/intl.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/OrderScreen';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (ctx, i) => Card(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('\$${orderData.orders[i].amount}'),
                      subtitle: Text(
                        DateFormat('dd MM yyyy hh:mm')
                            .format(orderData.orders[i].dateTime),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.expand_more),
                        onPressed: () {
                          setState(() {
                            _expanded = !_expanded;
                          });
                        },
                      ),
                    ),
                    if (_expanded)
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                        height: min(
                            orderData.orders[i].products.length * 20.0 + 10,
                            100),
                        child: ListView(
                          children: orderData.orders[i].products
                              .map(
                                (prod) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      prod.title,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${prod.quantity}x \$${prod.price}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      )
                  ],
                ),
              )),
    );
  }
}
