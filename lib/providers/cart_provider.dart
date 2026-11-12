import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tasks/models/product_model.dart';

class CartNotifier extends Notifier<List<ProductModel>>{
  @override
  
  List<ProductModel>build(){
    return[];
  }
  void addToCart(ProductModel product){
    state = [...state,product];
  }
  void removeCart(ProductModel product){
    state = state.where((item) => item.id != product.id).toList();
  }
 
}
 final cartProvider = 
  NotifierProvider<CartNotifier, List<ProductModel>>(
    CartNotifier.new,
  );