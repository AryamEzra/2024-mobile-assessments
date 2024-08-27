import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String message;

  const ServerException({required this.message});

  @override
  List<Object?> get props => [message];
}

class GroceriesNotFoundException extends Equatable implements Exception {
  final String message;

  const GroceriesNotFoundException({required this.message});

  @override
  List<Object?> get props => [message];
}

class CacheException extends Equatable implements Exception {
  final String message;

  const CacheException({required this.message});

  @override
  List<Object?> get props => [message];
}