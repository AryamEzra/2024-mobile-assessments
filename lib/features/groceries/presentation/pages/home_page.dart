import 'package:assessment/features/groceries/domain/use_cases/get_all_groceries.dart';
import 'package:assessment/features/groceries/presentation/bloc/home/home_bloc.dart';
import 'package:assessment/features/groceries/presentation/pages/detail_page.dart';
import 'package:assessment/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groceries'),
      ),
      body: BlocProvider(
        create: (context) =>
            HomeBloc(getAllGroceries: GetAllGroceries(getIt()))
              ..add(FetchGroceries()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return ListView.builder(
                itemCount: state.groceries.length,
                itemBuilder: (context, index) {
                  final grocery = state.groceries[index];
                  return ListTile(
                    title: Text(grocery.title),
                    subtitle: Text('\$${grocery.price}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(id: grocery.id),
                        ),
                      );
                    },
                  );
                },
              );
            } else if (state is HomeError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
