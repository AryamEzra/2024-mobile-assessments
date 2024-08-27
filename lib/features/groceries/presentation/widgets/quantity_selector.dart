import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final bool isInBasket;

  const QuantitySelector({super.key, this.isInBasket = false});

  @override
  // ignore: library_private_types_in_public_api
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double iconSize = widget.isInBasket ? 15.0 : 24.0;
    final double fontSize = widget.isInBasket ? 16.0 : 20.0;
    final double circleSize = widget.isInBasket ? 30.0 : 40.0;

    return Row(
      children: [
        Container(
          width: circleSize,
          height: circleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200], // Background color of the circle
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.remove),
              iconSize: iconSize,
              onPressed: _decrementQuantity,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('$quantity', style: TextStyle(fontSize: fontSize)), // Display selected quantity
        ),
        Container(
          width: circleSize,
          height: circleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200], // Background color of the circle
          ),
          child: Center(
            child: IconButton(
              icon: const Icon(Icons.add),
              iconSize: iconSize,
              onPressed: _incrementQuantity,
            ),
          ),
        ),
      ],
    );
  }
}
