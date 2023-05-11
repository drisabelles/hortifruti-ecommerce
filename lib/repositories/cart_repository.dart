import 'dart:collection';

import 'package:flutter_app/models/product_model.dart';
import 'package:flutter/material.dart';

class CartRepository extends ChangeNotifier {
  List<Product> _lista = [];

  UnmodifiableListView<Product> get lista => UnmodifiableListView(_lista);

  saveAll(List<Product> products) {
    products.forEach((product) {
      if (!_lista.contains(product)) _lista.add(product);
    });
    notifyListeners();
  }

  remove(Product product) {
    _lista.remove(product);
    notifyListeners();
  }
}