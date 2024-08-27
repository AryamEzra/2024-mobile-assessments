import 'package:assessment/features/groceries/domain/entities/groceries.dart';
import 'package:assessment/features/groceries/domain/use_cases/get_grocery.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final GetGroceriesById getGroceriesById;

  DetailsBloc({required this.getGroceriesById}) : super(DetailsInitial()) {
    on<FetchGroceryDetails>((event, emit) async {
      emit(DetailsLoading());
      final result = await getGroceriesById(GetGroceriesParams(event.id));
      result.fold(
        (failure) => emit(const DetailsError(message: 'Failed to fetch grocery details')),
        (grocery) => emit(DetailsLoaded(grocery: grocery)),
      );
    });
  }
  
}