import 'dart:convert';
import 'package:assessment/core/constants/constants.dart';
import 'package:assessment/core/errors/exception.dart';
import 'package:assessment/features/groceries/data/models/groceries_model.dart';
import 'package:http/http.dart' as http;

abstract class GroceriesRemoteDataSource {
  Future<List<GroceriesModel>> getAllGroceries();
  Future<GroceriesModel> getGroceriesById(String id);
}

class GroceriesRemoteDataSourceImpl implements GroceriesRemoteDataSource {
  final http.Client client;

  GroceriesRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<GroceriesModel>> getAllGroceries() async {
    try {
      final response = await client.get(
        Uri.parse(baseUrl),
        // Add authorization header if needed
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body)['data'];
        return jsonResponse.map((json) => GroceriesModel.fromJson(json)).toList();
      } else {
        throw ServerException(message: 'Server Error: ${response.statusCode}');
      }
    } catch (e) {
      throw ServerException(message: 'Server Error: $e');
    }
  }

  @override
  Future<GroceriesModel> getGroceriesById(String id) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/$id'),
        // Add authorization header if needed
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final groceriesJson = jsonResponse['data'];

        if (groceriesJson != null) {
          return GroceriesModel.fromJson(groceriesJson);
        } else {
          throw const GroceriesNotFoundException(message: 'Groceries data is null');
        }
      } else if (response.statusCode == 404) {
        throw const GroceriesNotFoundException(message: 'Groceries data is null');
      } else {
        throw ServerException(message: 'Server Error: ${response.statusCode}');
      }
    } on GroceriesNotFoundException {
      rethrow; // Re-throw the GroceriesNotFoundException
    } catch (e) {
      throw ServerException(message: 'Server Error: $e');
    }
  }
}


  
