import 'package:assessment/core/errors/failure.dart';
import 'package:assessment/features/groceries/domain/entities/groceries.dart';
import 'package:dartz/dartz.dart';

abstract class GroceriesRepository {
  Future<Either<Failure, List<Groceries>>> getAllGroceries();
  Future<Either<Failure, Groceries>> getGroceriesById(String id);
}