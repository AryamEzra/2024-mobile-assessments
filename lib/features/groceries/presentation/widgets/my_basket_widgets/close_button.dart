import 'package:flutter/material.dart';

class CloseButtonWidget extends StatelessWidget {
  final VoidCallback onClose;

  const CloseButtonWidget({required this.onClose, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close, color: Colors.grey),
      onPressed: onClose,
    );
  }
}
