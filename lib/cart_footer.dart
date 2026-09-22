import 'package:flutter/material.dart';

class CartFooter extends StatelessWidget {
  final double total;
  final int itemCount;
  final VoidCallback onCheckout;

  const CartFooter({
    super.key,
    required this.total,
    required this.itemCount,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.pink.shade50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total: \$${total.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            onPressed: itemCount > 0 ? onCheckout : null,
            child: const Text('Checkout'),
          ),
        ],
      ),
    );
  }
}
