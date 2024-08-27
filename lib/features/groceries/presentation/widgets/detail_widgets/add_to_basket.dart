import 'package:flutter/material.dart';
import 'package:assessment/core/routes/routes.dart';

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.pushNamed(
          context,
          Routes.mybasket,
        );
      },
      icon: const Icon(Icons.shopping_basket, color: Colors.white),
      label: const Text('Add to Basket', style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        backgroundColor: Color.fromRGBO(255, 99, 71, 1),
      ),
    );
  }
}
