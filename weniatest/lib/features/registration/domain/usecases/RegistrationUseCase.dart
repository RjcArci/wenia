import 'package:weniatest/features/registration/domain/entities/Registration.dart';
import 'package:weniatest/features/registration/domain/repository/RegistrationRepository.dart';

class RegistrationUseCase {
  final RegistrationRepository repository;

  RegistrationUseCase(this.repository);

  Future<void> execute(Registration registration) {
    return repository.register(registration);
  }
}
