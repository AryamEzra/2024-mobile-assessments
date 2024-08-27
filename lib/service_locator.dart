import 'package:assessment/core/network/network_info.dart';
import 'package:assessment/features/groceries/data/data_sources/local/local_data_source.dart';
import 'package:assessment/features/groceries/data/data_sources/remote/remote_data_source.dart';
import 'package:assessment/features/groceries/data/repositories/groceries_repository_impl.dart';
import 'package:assessment/features/groceries/domain/repositories/groceries_repository.dart';
import 'package:assessment/features/groceries/domain/use_cases/get_all_groceries.dart';
import 'package:assessment/features/groceries/domain/use_cases/get_grocery.dart';
import 'package:assessment/features/groceries/presentation/bloc/details/details_bloc.dart';
import 'package:assessment/features/groceries/presentation/bloc/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure binding is initialized

  final sharedPreferences = await SharedPreferences.getInstance();
  final client = http.Client();
  final internetConnectionChecker = InternetConnectionChecker();

  getIt.registerSingleton<SharedPreferences>(sharedPreferences);
  getIt.registerSingleton<http.Client>(client);
  getIt.registerSingleton<InternetConnectionChecker>(internetConnectionChecker);



  getIt.registerLazySingleton<GroceriesRemoteDataSource>(
    () => GroceriesRemoteDataSourceImpl(client: getIt()),
  );
  getIt.registerLazySingleton<GroceriesLocalDataSource>(
    () => GroceriesLocalDataSourceImpl(sharedPreferences: getIt()),
  );
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(internetConnectionChecker),
  );

  getIt.registerSingleton<GroceriesRepository>(GroceriesRepositoryImpl(
    remoteDataSource: getIt(),
    localDataSource: getIt(),
    networkInfo: getIt(),
  ));

  getIt.registerFactory(() => GetGroceriesById(getIt()));
  getIt.registerFactory(() => GetAllGroceries(getIt()));

  getIt.registerFactory<HomeBloc>(
    () => HomeBloc(getAllGroceries: getIt<GetAllGroceries>()),
  );
  // getIt.registerFactory<SearchBloc>(
  //   () => SearchBloc(getAllGroceriess: getIt<GetAllGroceriess>()),
  // );

  getIt.registerFactory(
      () => DetailsBloc(getGroceriesById: getIt<GetGroceriesById>()));

}

  