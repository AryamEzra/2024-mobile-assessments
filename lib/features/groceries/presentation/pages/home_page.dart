import 'package:assessment/features/groceries/domain/use_cases/get_all_groceries.dart';
import 'package:assessment/features/groceries/presentation/bloc/home/home_bloc.dart';
import 'package:assessment/features/groceries/presentation/widgets/home_widgets/custom_app_home_bar.dart';
import 'package:assessment/features/groceries/presentation/widgets/home_widgets/search_bar.dart';
import 'package:assessment/features/groceries/presentation/widgets/item_card.dart';
import 'package:assessment/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHomePageAppBar(),
      body: BlocProvider(
        create: (context) => HomeBloc(getAllGroceries: GetAllGroceries(getIt()))
          ..add(FetchGroceries()),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              ));
            } else if (state is HomeLoaded) {
              return Column(
                children: [
                  CustomSearchBar(
                    onChanged: (query) {
                      context
                          .read<HomeBloc>()
                          .add(SearchGroceries(query: query));
                    },
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<HomeBloc>().add(FetchGroceries());
                      },
                      color: Colors.orange,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of items per row
                          childAspectRatio: 2 / 3, // Aspect ratio of each item
                        ),
                        itemCount: state.groceries.length,
                        itemBuilder: (context, index) {
                          final grocery = state.groceries[index];
                          return GroceryItemCard(grocery: grocery);
                        },
                      ),
                    ),
                  ),
                ],
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
