import 'package:assessment/core/errors/failure.dart';
import 'package:assessment/core/use_cases/no_para_use_case.dart';
import 'package:assessment/features/groceries/domain/entities/groceries.dart';
import 'package:assessment/features/groceries/domain/repositories/groceries_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllGroceries extends NoParamsUseCase<Future<Either<Failure, List<Groceries>>>> {
  final GroceriesRepository repository;

  GetAllGroceries(this.repository);

  @override
  Future<Either<Failure, List<Groceries>>> call() async {
    return await repository.getAllGroceries();
  }
}
