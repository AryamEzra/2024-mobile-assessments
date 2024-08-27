part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchGroceries extends HomeEvent {}

class SearchGroceries extends HomeEvent {
  final String query;

  SearchGroceries({required this.query});
}

class ToggleFavoriteEvent extends HomeEvent {
  final String groceryId;

  ToggleFavoriteEvent(this.groceryId);
}