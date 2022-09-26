import 'package:tvs_movies_app/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}

class DataBaseException implements Exception {
  final String message;

  DataBaseException({required this.message});
}
