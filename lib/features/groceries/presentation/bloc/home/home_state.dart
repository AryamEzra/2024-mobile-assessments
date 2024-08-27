part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Groceries> groceries;

  const HomeLoaded({required this.groceries});

  @override
  List<Object> get props => [groceries];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({required this.message});

  @override
  List<Object> get props => [message];
}
