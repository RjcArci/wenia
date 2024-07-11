import 'package:weniatest/features/crypto/domain/entities/Crypto.dart';

abstract class CryptoRepository {
  Future<List<Crypto>> searchCryptos();
  Future<List<Crypto>> searchCrypto(String name);
  Future<List<Crypto>> getSavedCryptos();
  Future<void> saveCrypto(Crypto crypto);
  Future<void> removeFavorite(Crypto crypto);
}