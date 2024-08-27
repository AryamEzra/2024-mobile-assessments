part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchGroceries extends HomeEvent {}

class SearchGroceries extends HomeEvent {
  final String query;

  const SearchGroceries({required this.query});
}

