import 'package:weniatest/features/login/domain/entities/AuthCredentials.dart';
import 'package:weniatest/features/login/domain/repositories/AuthRepository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<void> execute(String email, String password) {
    return repository.login(AuthCredentials(email: email, password: password));
  }
}
