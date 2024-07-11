import 'package:flutter/material.dart';
import 'package:weniatest/features/crypto/domain/entities/Crypto.dart';
import 'package:weniatest/features/crypto/domain/usecases/GetSavedCryptosUseCase.dart';
import 'package:weniatest/features/crypto/domain/usecases/RemoveCryptoUseCase.dart';
import 'package:weniatest/features/crypto/domain/usecases/SaveCryptoUseCase.dart';
import 'package:weniatest/features/crypto/domain/usecases/SearchCryptoUseCase.dart';

class CryptoSearchViewModel extends ChangeNotifier {
  final SearchCryptoUseCase searchCryptosUseCase;
  final SaveCryptoUseCase saveCryptoUseCase;
  final RemoveCryptoUseCase removeCryptoUseCase;
  final GetSavedCryptosUseCase getSavedCryptosUseCase;

  CryptoSearchViewModel({
    required this.searchCryptosUseCase,
    required this.saveCryptoUseCase,
    required this.removeCryptoUseCase,
    required this.getSavedCryptosUseCase,
  });

  List<Crypto> _cryptos = [];

  List<Crypto> get cryptos => _cryptos;

  List<Crypto> _favorites = [];

  List<Crypto> get favorites => _favorites;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _error;

  String? get error => _error;

  bool _isDescending = true;

  bool get isDescending => _isDescending;

  Future<void> searchCryptos() async {
    _isLoading = true;
    notifyListeners();
    getFavoritesCryptos();
    try {
      _cryptos = await searchCryptosUseCase.searchCryptos();
      _error = null;
      _sortCryptos();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> searchCryptoByName(String name) async {
    _isLoading = true;
    notifyListeners();
    try {
      _cryptos = await searchCryptosUseCase.searchCryptoByName(name);
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addFavorite(Crypto crypto) async {
    await saveCryptoUseCase.execute(crypto);
    getFavoritesCryptos();
  }

  Future<void> getFavoritesCryptos() async {
    try {
      _favorites = await getSavedCryptosUseCase.execute();
    } catch (e) {
      _error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> removeFavorite(Crypto crypto) async {
    _favorites.removeWhere((item) => item.id == crypto.id);
    await removeCryptoUseCase.execute(crypto);
    notifyListeners();
  }

  bool isFavorite(Crypto crypto) {
    return _favorites.any((item) => item.id == crypto.id);
  }

  void toggleSortOrder() {
    _isDescending = !_isDescending;
    _sortCryptos();
    notifyListeners();
  }

  void _sortCryptos() {
    if (cryptos.length > 2)
      _cryptos.sort((a, b) => _isDescending
          ? b.price.compareTo(a.price)
          : a.price.compareTo(b.price));
  }
}
