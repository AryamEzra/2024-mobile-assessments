import 'package:assessment/features/groceries/presentation/widgets/detail_widgets/bottom_widget.dart';
import 'package:assessment/features/groceries/presentation/widgets/detail_widgets/custom_app_bar_details.dart';
import 'package:assessment/features/groceries/presentation/widgets/detail_widgets/custom_check_box.dart';
import 'package:assessment/features/groceries/presentation/widgets/detail_widgets/descrption_widget.dart';
import 'package:assessment/features/groceries/presentation/widgets/favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:assessment/features/groceries/presentation/bloc/details/details_bloc.dart';
import 'package:assessment/features/groceries/domain/use_cases/get_grocery.dart';
import 'package:assessment/service_locator.dart';

class DetailsPage extends StatelessWidget {
  final String id;

  const DetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            DetailsBloc(getGroceriesById: GetGroceriesById(getIt()))
              ..add(FetchGroceryDetails(id: id)),
        child: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            if (state is DetailsLoading) {
              return const Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),));
            } else if (state is DetailsLoaded) {
              final grocery = state.grocery;
              return Stack(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.only(
                        bottom:
                            100), // Add padding to prevent overlap with BottomWidget
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      grocery.imageUrl,
                                      width: double.infinity,
                                      height: 300,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const Positioned(
                                      bottom: 10,
                                      right: 10,
                                      child: FavoriteWidget()),
                                  const Positioned(
                                      top: 1.0,
                                      left: 1.0,
                                      child: CustomBackButtonDetailsPage()),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      grocery.title,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    '£${grocery.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '£${grocery.discount.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.yellow, size: 20),
                                  const SizedBox(width: 4),
                                  Text(
                                    grocery.rating.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    '(Reviews)',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {
                                      // Navigate to all reviews
                                    },
                                    child: const Text('See all reviews',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(105, 112, 121, 1),
                                          fontSize: 16,
                                          decoration: TextDecoration.underline,
                                        )),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              DescriptionWidget(
                                  description: grocery.description),
                              // const SizedBox(height: 16),
                              if (grocery.options.isNotEmpty) ...[
                                const Text(
                                  'Additional Options:',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                ...grocery.options.map((option) => Row(
                                      children: [
                                        Text(option.name),
                                        const Spacer(), // Pushes the following widgets to the right
                                        Text(
                                            '+ £${option.price.toStringAsFixed(2)}'),
                                        const CustomCheckbox()
                                      ],
                                    )),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: BottomWidget(),
                  ),
                ],
              );
            } else if (state is DetailsError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
