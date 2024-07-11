import 'package:weniatest/features/crypto/data/datasource/local/CryptoLocalDataSource.dart';
import 'package:weniatest/features/crypto/data/datasource/remote/CryptoRemoteDataSource.dart';
import 'package:weniatest/features/crypto/data/dtos/CryptoDTO.dart';
import 'package:weniatest/features/crypto/domain/entities/Crypto.dart';
import 'package:weniatest/features/crypto/domain/repositories/CryptoRepository.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  final CryptoRemoteDataSource remoteDataSource;
  final CryptoLocalDataSource localDataSource;

  CryptoRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Crypto>> searchCryptos() async {
    final cryptoDTOs = await remoteDataSource.searchCryptos();
    return cryptoDTOs.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<List<Crypto>> searchCrypto(String name) async {
    final cryptoDTOs = await remoteDataSource.searchCrypto(name);
    return cryptoDTOs.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<void> saveCrypto(Crypto crypto) async {
    final cryptoDTO = CryptoDTO(
      id: crypto.id,
      name: crypto.name,
      symbol: crypto.symbol,
      price: crypto.price.toDouble(),
      image: crypto.image,
    );
    print(' ${cryptoDTO.price} saved to local data source');
    return localDataSource.saveCrypto(cryptoDTO);
  }

  @override
  Future<List<Crypto>> getSavedCryptos() async {
    final cryptoDTOs = await localDataSource.getSavedCryptos();
    return cryptoDTOs.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<void> removeFavorite(Crypto crypto) async {
    await localDataSource.removeCrypto(crypto.id);
  }
}