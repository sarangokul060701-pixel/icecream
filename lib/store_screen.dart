import 'package:flutter/material.dart';
import 'ice_cream.dart';
import 'ice_cream_tile.dart';
import 'cart_footer.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final Map<String, int> cart = {};

  double get total => flavors.fold(0, (sum, f) {
    final qty = cart[f.name] ?? 0;
    return sum + (f.price * qty);
  });

  int get itemCount => cart.values.fold(0, (a, b) => a + b);

  void addToCart(String name) {
    setState(() => cart[name] = (cart[name] ?? 0) + 1);
  }

  void removeFromCart(String name) {
    setState(() {
      if (cart[name] != null && cart[name]! > 0) {
        cart[name] = cart[name]! - 1;
        if (cart[name] == 0) cart.remove(name);
      }
    });
  }

  void checkout() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Order placed! 🍨')),
    );
    setState(() => cart.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🍦 Scoop Store'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text('Cart: $itemCount', style: const TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: flavors.length,
        itemBuilder: (context, index) {
          final f = flavors[index];
          return IceCreamTile(
            flavor: f,
            quantity: cart[f.name] ?? 0,
            onAdd: () => addToCart(f.name),
            onRemove: () => removeFromCart(f.name),
          );
        },
      ),
      bottomNavigationBar: CartFooter(
        total: total,
        itemCount: itemCount,
        onCheckout: checkout,
      ),
    );
  }
}

