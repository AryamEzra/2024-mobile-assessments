import 'package:assessment/features/groceries/presentation/widgets/my_basket_widgets/close_button.dart';
import 'package:assessment/features/groceries/presentation/widgets/quantity_selector.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatefulWidget {
  final String title;
  final String? originalPrice;
  final String discountedPrice;
  final String imageUrl;
  final List<Map<String, String>> options;

  const OrderItem({
    required this.title,
    required this.originalPrice,
    required this.discountedPrice,
    required this.imageUrl,
    required this.options,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) {
      return const SizedBox.shrink(); // If the item is removed, show nothing
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2), // Shadow all around
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // First column: Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      widget.imageUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Second column: Name, Price, Quantity controls
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Price (Original and Discounted)
                        Row(
                          children: [
                            if (widget.originalPrice != null)
                              Text(
                                widget.originalPrice!,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            if (widget.originalPrice != null)
                              const SizedBox(width: 4),
                            Text(
                              widget.discountedPrice,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        
                          const QuantitySelector(isInBasket: true,),
                        
                      ],
                    ),
                  ),
                ],
              ),
              // Add a divider if there are options
              if (widget.options.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(
                    color: Colors.grey[300],
                    thickness: 1.0,
                  ),
                ),
              // Second row: Options (only shown if there are options available)
              if (widget.options.isNotEmpty)
                Column(
                  children: widget.options.map((option) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            option['title']!,
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            option['price']!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
          // Use the CloseButtonWidget here
          Positioned(
            top: 0,
            right: 0,
            child: CloseButtonWidget(
              onClose: () {
                setState(() {
                  _isVisible = false; // Remove the item from the UI
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
