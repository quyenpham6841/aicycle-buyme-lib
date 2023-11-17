import 'package:dartz/dartz.dart';

import '../../../../network/api_error.dart';

abstract class AuthenRepository {
  Future<Either<APIErrors, dynamic>> login(
    String username,
    String password,
  );
}
