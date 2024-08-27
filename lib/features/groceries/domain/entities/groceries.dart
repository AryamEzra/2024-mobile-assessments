import 'package:equatable/equatable.dart';

class Groceries extends Equatable {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  final double discount;
  final List<Option> options;

  const Groceries({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.discount,
    required this.options,
  });

  @override
  List<Object?> get props => [id, title, description, price, imageUrl, rating, discount, options];
}

class Option extends Equatable {
  final String id;
  final String name;
  final double price;

  const Option({
    required this.id,
    required this.name,
    required this.price,
  });

  @override
  List<Object?> get props => [id, name, price];
}