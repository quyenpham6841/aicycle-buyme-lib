import 'package:aicycle_buyme_lib/network/api_error.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/example_repository.dart';
import '../remote_data/common_api.dart';

class ExampleRepositoryImpl implements AuthenRepository {
  @override
  Future<Either<APIErrors, dynamic>> login(
      String username, String password) async {
    try {
      final body = await CommonApi.login(username, password).request();
      final data = Map<String, dynamic>.from(body);
      return Right(data);
    } on APIErrors catch (error) {
      return Left(error);
    }
  }
}
