import 'package:assessment/core/errors/exception.dart';
import 'package:assessment/features/groceries/data/models/groceries_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class GroceriesLocalDataSource {
  Future<List<GroceriesModel>> getAllGroceries();
  Future<GroceriesModel> getGroceriesById(String id);
  Future<void> cacheGroceries(List<GroceriesModel> groceries);
  Future<void> cacheGrocery(GroceriesModel grocery);
}

class GroceriesLocalDataSourceImpl implements GroceriesLocalDataSource {
  final SharedPreferences sharedPreferences;

  GroceriesLocalDataSourceImpl({required this.sharedPreferences});

  static const cachedGroceries = 'cachedGroceries';
  static const cachedGroceryPrefix = 'CACHED_GROCERY_';

  @override
  Future<List<GroceriesModel>> getAllGroceries() async {
    final jsonString = sharedPreferences.getString(cachedGroceries);
    if (jsonString != null) {
      final List<dynamic> jsonResponse = json.decode(jsonString);
      return jsonResponse.map((json) => GroceriesModel.fromJson(json)).toList();
    } else {
      throw const CacheException(message: 'Cache Exception: Grocery not found');
    }
  }

  @override
  Future<GroceriesModel> getGroceriesById(String id) async {
    final jsonString = sharedPreferences.getString('$cachedGroceryPrefix$id');
    if (jsonString != null) {
      final Map<String, dynamic> jsonResponse = json.decode(jsonString);
      return GroceriesModel.fromJson(jsonResponse);
    } else {
      throw const CacheException(message: 'Cache Exception: Grocery not found');
    }
  }

  @override
  Future<void> cacheGroceries(List<GroceriesModel> groceries) async {
    final List<Map<String, dynamic>> jsonList = groceries.map((grocery) => grocery.toJson()).toList();
    sharedPreferences.setString(cachedGroceries, json.encode(jsonList));
  }

  @override
  Future<void> cacheGrocery(GroceriesModel grocery) async {
    sharedPreferences.setString('$cachedGroceryPrefix${grocery.id}', json.encode(grocery.toJson()));
  }
}
