import 'package:assessment/core/errors/failure.dart';
import 'package:assessment/features/groceries/domain/entities/groceries.dart';
import 'package:assessment/features/groceries/domain/repositories/groceries_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/use_cases/use_case.dart';

class GetGroceriesParams {
  final String id;

  GetGroceriesParams(this.id);
}

class GetGroceriesById extends UseCase<Groceries, GetGroceriesParams> {
  final GroceriesRepository repository;

  GetGroceriesById(this.repository);

  @override
  Future<Either<Failure, Groceries>> call(GetGroceriesParams params) async {
    return await repository.getGroceriesById(params.id);
  }
}