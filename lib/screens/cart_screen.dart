import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tasks/providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Cart"),
      ),
      body: ListView.builder(itemCount: cartItems.length,
      itemBuilder:(context,index){
       final product = cartItems[index];
       return Card(
        child: ListTile(
          title: Text(product.name),
          subtitle: Text('₹${product.price}'),
          trailing: IconButton(onPressed: (){
            ref.read(cartProvider.notifier).removeCart(product);
          }, icon: Icon(Icons.delete)),
        ),
       );
      }),
    );
  }
}