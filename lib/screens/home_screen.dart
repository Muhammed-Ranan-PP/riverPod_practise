import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tasks/data/product_data.dart';
import 'package:riverpod_tasks/providers/cart_provider.dart';
import 'package:riverpod_tasks/screens/cart_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final products = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Shopping page"),
        actions: [
          Badge(
            label: Text(cartItems.length.toString()),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              title: Text(product.name),
              subtitle: Text('₹${product.price}'),
              trailing: IconButton(
                onPressed: () {
                  ref.read(cartProvider.notifier).addToCart(product);
                },
                icon: Icon(Icons.add_shopping_cart),
              ),
            ),
          );
        },
      ),
    );
  }
}
