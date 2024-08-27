import 'package:flutter/material.dart';

class BottomWidget extends StatefulWidget {
  @override
  _BottomWidgetState createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        
        children: [
          SizedBox(height:16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200], // Background color of the circle
                ),
                child: IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _decrementQuantity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('$quantity', style: TextStyle(fontSize:20)), // Display selected quantity
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200], // Background color of the circle
                ),
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _incrementQuantity,
                ),
              ),
            ],
          ),
              ElevatedButton.icon(
                onPressed: () {
                  // Add to basket action
                },
                icon: const Icon(Icons.shopping_basket, color: Colors.white),
                label: const Text('Add to Basket', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  backgroundColor: Colors.orange,
                ),
              ),
            ],
          ),
      SizedBox(height:16),
        ],
      ),
    );
  }
}