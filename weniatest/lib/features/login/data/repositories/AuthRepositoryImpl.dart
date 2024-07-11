import 'package:weniatest/features/login/domain/entities/AuthCredentials.dart';
import 'package:weniatest/features/login/domain/repositories/AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository {

  AuthRepositoryImpl();

  @override
  Future<void> login(AuthCredentials credentials) {
    // TODO: implement login
    throw UnimplementedError();
  }

}