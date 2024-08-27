import 'package:assessment/core/errors/failure.dart';
import 'package:assessment/core/network/network_info.dart';
import 'package:assessment/features/groceries/data/data_sources/local/local_data_source.dart';
import 'package:assessment/features/groceries/data/data_sources/remote/remote_data_source.dart';
import 'package:assessment/features/groceries/domain/entities/groceries.dart';
import 'package:assessment/features/groceries/domain/repositories/groceries_repository.dart';
import 'package:dartz/dartz.dart';

class GroceriesRepositoryImpl implements GroceriesRepository {
  final GroceriesRemoteDataSource remoteDataSource;
  final GroceriesLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GroceriesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Groceries>>> getAllGroceries() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteGroceries = await remoteDataSource.getAllGroceries();
        localDataSource.cacheGroceries(remoteGroceries);
        return Right(remoteGroceries);
      } catch (e) {
        return Left(ServerFailure('message: $e'));
      }
    } else {
      try {
        final localGroceries = await localDataSource.getAllGroceries();
        return Right(localGroceries);
      } catch (e) {
        return Left(CacheFailure('message: $e'));
      }
    }
  }

  @override
  Future<Either<Failure, Groceries>> getGroceriesById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteGrocery = await remoteDataSource.getGroceriesById(id);
        localDataSource.cacheGrocery(remoteGrocery);
        return Right(remoteGrocery);
      } catch (e) {
        return Left(ServerFailure('message: $e'));
      }
    } else {
      try {
        final localGrocery = await localDataSource.getGroceriesById(id);
        return Right(localGrocery);
      } catch (e) {
        return Left(CacheFailure('message: $e'));
      }
    }
  }

  
}
