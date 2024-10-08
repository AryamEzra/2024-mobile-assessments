import 'package:assessment/features/groceries/domain/entities/groceries.dart';
import 'package:assessment/features/groceries/domain/use_cases/get_all_groceries.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllGroceries getAllGroceries;

  HomeBloc({required this.getAllGroceries}) : super(HomeInitial()) {
    on<FetchGroceries>((event, emit) async {
      emit(HomeLoading());
      final result = await getAllGroceries();
      result.fold(
        (failure) => emit(const HomeError(message: 'Failed to fetch groceries')),
        (groceries) => emit(HomeLoaded(groceries: groceries)),
      );
    });

    on<SearchGroceries>((event, emit) async {
      if (event.query.isEmpty) {
        // Re-fetch all groceries if the search query is empty
        add(FetchGroceries());
      } else if (state is HomeLoaded) {
        final filteredGroceries = (state as HomeLoaded).groceries.where((grocery) {
          return grocery.title.toLowerCase().contains(event.query.toLowerCase());
        }).toList();
        emit(HomeLoaded(groceries: filteredGroceries));
      }
    });
  }
}

