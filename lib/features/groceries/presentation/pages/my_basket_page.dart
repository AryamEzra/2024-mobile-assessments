import 'package:assessment/features/groceries/presentation/widgets/my_basket_widgets/order_item.dart';
import 'package:assessment/features/groceries/presentation/widgets/my_basket_widgets/price_row.dart';
import 'package:flutter/material.dart';


class MyBasketPage extends StatelessWidget {
  const MyBasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('My Basket'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Order Summary',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.orange,
                    side: const BorderSide(color: Colors.orange, width: 2.0),
                  ),
                  child: const Text('Add Items'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: const [
                  OrderItem(
                    title: 'Chicken Burger',
                    originalPrice: '£10.00',
                    discountedPrice: '£6.00',
                    imageUrl: 'assets/images/burger.jpg',
                    options: [
                      {'title': 'Add Cheese', 'price': '£0.50'},
                      {'title': 'Add Meat (Extra Patty)', 'price': '£2.00'},
                    ],
                  ),
                  OrderItem(
                    title: 'Ramen Noodles',
                    originalPrice: '£22.00',
                    discountedPrice: '£15.00',
                    imageUrl: 'assets/images/noodles.jpg',
                    options: [],
                  ),
                  OrderItem(
                    title: 'Cherry Tomato Salad',
                    originalPrice: null,
                    discountedPrice: '£8.00',
                    imageUrl: 'assets/images/salad.jpg',
                    options: [],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            buildPriceRow('Subtotal', '£31.50'),
            buildPriceRow('Delivery Fee', 'FREE'),
            buildPriceRow('Discount', '- £6.30', isDiscount: true),
            const Divider(),
            buildPriceRow('Total', '£25.20', isTotal: true),
            const SizedBox(height: 16),
            Row(
              
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 20),
                const Text(
                  '£25.20',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width:20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Place Order',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                
              ],
            ),
          ],
        ),
      ),
    );
  }

}
