import 'package:riverpod_tasks/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsProvider = Provider<List<ProductModel>>((ref) {
  return [
    ProductModel(id: 1, name: "Apple", price: 100.0),
    ProductModel(id: 2, name: "Milk", price: 50.0),
    ProductModel(id: 3, name: "Bread", price: 40.0),
    ProductModel(id: 4, name: "Orange", price: 80.0),
  ];
} );