import 'package:assessment/features/groceries/domain/use_cases/get_grocery.dart';
import 'package:assessment/features/groceries/presentation/bloc/details/details_bloc.dart';
import 'package:assessment/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatelessWidget {
  final String id;

  const DetailsPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grocery Details'),
      ),
      body: BlocProvider(
        create: (context) => DetailsBloc(getGroceriesById: GetGroceriesById(getIt()))..add(FetchGroceryDetails(id: id)),
        child: BlocBuilder<DetailsBloc, DetailsState>(
          builder: (context, state) {
            if (state is DetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DetailsLoaded) {
              final grocery = state.grocery;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(grocery.imageUrl),
                    const SizedBox(height: 16),
                    Text(grocery.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('\$${grocery.price}', style: const TextStyle(fontSize: 20)),
                    const SizedBox(height: 8),
                    Text(grocery.description),
                    const SizedBox(height: 16),
                    const Text('Options:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ...grocery.options.map((option) => Text('${option.name}: \$${option.price}')),
                  ],
                ),
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
