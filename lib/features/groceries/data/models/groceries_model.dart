
import 'package:assessment/features/groceries/domain/entities/groceries.dart';

class GroceriesModel extends Groceries {
  const GroceriesModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.imageUrl,
    required super.rating,
    required super.discount,
    required super.options,
  });

  factory GroceriesModel.fromJson(Map<String, dynamic> json) {
    return GroceriesModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      options: (json['options'] as List<dynamic>)
          .map((option) => OptionModel.fromJson(option as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'rating': rating,
      'discount': discount,
      'options': options.map((option) => (option as OptionModel).toJson()).toList(),
    };
  }
}


class OptionModel extends Option {
  const OptionModel({
    required super.id,
    required super.name,
    required super.price,
  });

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
}