import 'package:weniatest/features/crypto/domain/entities/Crypto.dart';
import 'package:weniatest/features/crypto/domain/repositories/CryptoRepository.dart';

class RemoveCryptoUseCase {
  final CryptoRepository repository;

  RemoveCryptoUseCase(this.repository);

  Future<void> execute(Crypto crypto) {
    return repository.removeFavorite(crypto);
  }
}