import 'package:flutter/material.dart';

class CustomBackButtonDetailsPage extends StatelessWidget {
  const CustomBackButtonDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
  width: 40.0, // Set the desired width
  height: 40.0, // Set the desired height
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.black.withOpacity(0.1), // Offset black color
  ),
  child: const Icon(
    Icons.arrow_back,
    color: Colors.black,
    size: 20,
  ),
),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}