import 'package:flutter/material.dart';
import 'ice_cream.dart';

class IceCreamTile extends StatelessWidget {
  final IceCream flavor;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const IceCreamTile({
    super.key,
    required this.flavor,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.pink.shade100,
          child: Icon(flavor.icon, color: Colors.pink.shade700),
        ),
        title: Text(flavor.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text('${flavor.flavorDesc}\n\$${flavor.price.toStringAsFixed(2)}'),
        isThreeLine: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: quantity > 0 ? onRemove : null,
            ),
            Text('$quantity', style: const TextStyle(fontSize: 16)),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: onAdd,
            ),
          ],
        ),
      ),
    );
  }
}
