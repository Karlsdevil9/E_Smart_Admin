import 'package:flutter/foundation.dart';

class ProductsProvider with ChangeNotifier {
  List _items = [
    {
      'id': '1',
      'Title': 'Shirt',
      'Description': 'This is a blue colour denim',
      'Link':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSwFFvqCJ2HpCyg-hLbRXv7eUH67Z7YT4Q79Q&usqp=CAU',
      'Price': 1000.0,
      'Category': 'Men',
      'Quantity': 1,
      'fav': false
    },
    {
      'id': '2',
      'Title': 'Shirt',
      'Description': 'This is a blue colour denim',
      'Link':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSwFFvqCJ2HpCyg-hLbRXv7eUH67Z7YT4Q79Q&usqp=CAU',
      'Price': 1000.0,
      'Category': 'Men',
      'Quantity': 1,
      'fav': false
    },
    {
      'id': '3',
      'Title': 'Shirt',
      'Description': 'This is a blue colour denim',
      'Link':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSwFFvqCJ2HpCyg-hLbRXv7eUH67Z7YT4Q79Q&usqp=CAU',
      'Price': 1000.0,
      'Category': 'Men',
      'Quantity': 1,
      'fav': false
    },
    {
      'id': '4',
      'Title': 'Shirt',
      'Description': 'This is a blue colour denim',
      'Link':
          'https://th.bing.com/th/id/OIP.CenRsuUA4_pO9KRFAcMb-QHaIO?pid=Api&w=497&h=552&rs=1',
      'Price': 1000.0,
      'Category': 'Men',
      'Quantity': 1,
      'fav': false
    }
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

  void toggleFav(int index) {
    _items[index]['fav'] = !_items[index]['fav'];
    notifyListeners();
  }
}
