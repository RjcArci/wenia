import 'package:weniatest/features/login/domain/entities/AuthCredentials.dart';

abstract class AuthRepository {
  Future<void> login(AuthCredentials credentials);
}
