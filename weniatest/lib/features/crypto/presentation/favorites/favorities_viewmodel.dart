import 'package:flutter/material.dart';
import 'package:weniatest/features/crypto/domain/entities/Crypto.dart';
import 'package:weniatest/features/crypto/domain/usecases/GetSavedCryptosUseCase.dart';

class CryptoFavoritesViewModel extends ChangeNotifier {
  final GetSavedCryptosUseCase getSavedCryptos;

  CryptoFavoritesViewModel({
    required this.getSavedCryptos,
  });

  List<Crypto> _cryptos = [];
  List<Crypto> get cryptos => _cryptos;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> getFavoritesCryptos() async {
    _isLoading = true;
    print('Loading favorites cryptos...');
    notifyListeners();
    try {
      _cryptos = await getSavedCryptos.execute();
      _error = null;
    } catch (e) {
      print('error: $e');
      _error = e.toString();
    } finally {
      print('finished loading favorites cryptos...');
      _isLoading = false;
      notifyListeners();
    }
  }
}
