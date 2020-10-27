import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class ProductsProvider with ChangeNotifier {
  List _items = [
    Product(
      id: '1',
      title: 'Shirt',
      description: 'This is a blue colour denim',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSwFFvqCJ2HpCyg-hLbRXv7eUH67Z7YT4Q79Q&usqp=CAU',
      price: 1000.0,
    ),
    Product(
      id: '2',
      title: 'Shirt',
      description: 'This is a blue colour denim',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSwFFvqCJ2HpCyg-hLbRXv7eUH67Z7YT4Q79Q&usqp=CAU',
      price: 1000.0,
    ),
    Product(
      id: '3',
      title: 'Shirt',
      description: 'This is a blue colour denim',
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSwFFvqCJ2HpCyg-hLbRXv7eUH67Z7YT4Q79Q&usqp=CAU',
      price: 1000.0,
    ),
    Product(
      id: '4',
      title: 'Shirt',
      description: 'This is a blue colour denim',
      imageUrl:
          'https://th.bing.com/th/id/OIP.CenRsuUA4_pO9KRFAcMb-QHaIO?pid=Api&w=497&h=552&rs=1',
      price: 1000.0,
    )
  ];

  List get items {
    return [..._items];
  }

  List get favItems {
    return _items.where((element) => element['fav']).toList();
  }

  int findById(String id) {
    return _items.indexWhere((element) => element['id'] == id);
  }

  void addItem() {
    notifyListeners();
  }
}
