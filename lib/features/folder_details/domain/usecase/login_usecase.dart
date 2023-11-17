import 'package:dartz/dartz.dart';

import '../../../../network/api_error.dart';
import '../repository/example_repository.dart';

class LoginUsecase {
  final AuthenRepository repository;
  LoginUsecase(this.repository);

  Future<Either<APIErrors, dynamic>> call(
    String username,
    String password,
  ) async {
    return repository.login(username, password);
  }
}
