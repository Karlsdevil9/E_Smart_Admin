import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './APIs.dart';

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

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favItems {
    return _items.where((element) => element['fav']).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addProduct(Product product) {
    final url = Apis.productApi;
    return http
        .post(url,
            body: json.encode({
              'title': product.title,
              'description': product.description,
              'price': product.price,
              'imageUrl': product.imageUrl
            }))
        .then((response) {
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );

      _items.insert(0, newProduct);
      notifyListeners();
    });
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
