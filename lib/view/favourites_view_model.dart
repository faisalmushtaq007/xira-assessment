import 'package:ecommerce/app/pages/admin/product.dart';
import 'package:flutter/material.dart';

class FavouritesViewModel extends ChangeNotifier {
  final List<Product> productsBag;

  FavouritesViewModel() : productsBag = [];

  void addProduct(Product product) {
    productsBag.add(product);
    notifyListeners();
  }

  void removeProduct(Product product) {
    productsBag.remove(product);
    notifyListeners();
  }

    int get totalProducts => productsBag.length;

  bool get isFavouritesEmpty => productsBag.isEmpty;
}
