import 'package:flutter/material.dart';

class IceCream {
  final String name;
  final String flavorDesc;
  final double price;
  final IconData icon;

  const IceCream(this.name, this.flavorDesc, this.price, this.icon);
}

const List<IceCream> flavors = [
  IceCream('Vanilla Bean', 'Classic Madagascar vanilla', 3.50, Icons.icecream),
  IceCream('Choco Fudge', 'Rich dark chocolate swirl', 4.00, Icons.icecream),
  IceCream('Strawberry', 'Fresh strawberry chunks', 3.75, Icons.icecream),
  IceCream('Mango Delight', 'Sweet Alphonso mango', 4.25, Icons.icecream),
  IceCream('Pistachio', 'Roasted pistachio blend', 4.50, Icons.icecream),
];
