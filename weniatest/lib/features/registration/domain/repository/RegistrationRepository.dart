import 'package:weniatest/features/registration/domain/entities/Registration.dart';

abstract class RegistrationRepository {
  Future<void> register(Registration registration);
}
