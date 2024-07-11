import 'package:weniatest/features/crypto/domain/entities/Crypto.dart';
import 'package:weniatest/features/crypto/domain/repositories/CryptoRepository.dart';

class GetSavedCryptosUseCase {
  final CryptoRepository repository;

  GetSavedCryptosUseCase(this.repository);

  Future<List<Crypto>> execute() {
    return repository.getSavedCryptos();
  }
}
