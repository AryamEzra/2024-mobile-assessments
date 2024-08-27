import 'package:assessment/features/groceries/presentation/widgets/detail_widgets/add_to_basket.dart';
import 'package:flutter/material.dart';
import 'package:assessment/features/groceries/presentation/widgets/quantity_selector.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QuantitySelector(),
                AddToBasketButton(),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
