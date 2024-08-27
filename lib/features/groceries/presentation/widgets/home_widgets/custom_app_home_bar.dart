import 'package:flutter/material.dart';

class CustomHomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Icon(Icons.fastfood),
          const SizedBox(width: 8),
          Text('Burger'),
          Spacer(),
          Icon(Icons.local_offer),
        ],
      ),
      centerTitle: true,
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.tune),
      //     onPressed: () {
      //       // Add filter functionality
      //     },
      //   ),
      // ],
      backgroundColor: Colors.orange,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
