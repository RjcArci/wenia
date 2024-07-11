import 'package:weniatest/features/crypto/domain/entities/Crypto.dart';
import 'package:weniatest/features/crypto/domain/repositories/CryptoRepository.dart';

class SaveCryptoUseCase {
  final CryptoRepository repository;

  SaveCryptoUseCase(this.repository);

  Future<void> execute(Crypto crypto) {
    return repository.saveCrypto(crypto);
  }
}
