import 'package:flutter/material.dart';

class CustomHomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomHomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        children: [
          Icon(Icons.fastfood),
          SizedBox(width: 8),
          Text('Burger'),
          Spacer(),
          Icon(Icons.local_offer),
        ],
      ),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(255, 99, 71, 1),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
