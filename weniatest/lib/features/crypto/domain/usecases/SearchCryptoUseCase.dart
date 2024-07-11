import 'package:weniatest/features/crypto/domain/entities/Crypto.dart';
import 'package:weniatest/features/crypto/domain/repositories/CryptoRepository.dart';

class SearchCryptoUseCase {
  final CryptoRepository repository;

  SearchCryptoUseCase(this.repository);

  Future<List<Crypto>> searchCryptoByName(String name) {
    return repository.searchCrypto(name);
  }

  Future<List<Crypto>> searchCryptos() {
    return repository.searchCryptos();
  }
}
