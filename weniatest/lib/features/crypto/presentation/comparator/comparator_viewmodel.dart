import 'package:flutter/material.dart';
import 'package:weniatest/features/crypto/domain/entities/Crypto.dart';
import 'package:weniatest/features/crypto/domain/usecases/SearchCryptoUseCase.dart';

class CryptoComparatorViewModel extends ChangeNotifier {
  final SearchCryptoUseCase searchCrypto;

  CryptoComparatorViewModel({required this.searchCrypto});

  List<Crypto> _cryptos = [];

  List<Crypto> get cryptos => _cryptos;

  Crypto? _selectedCryptoLeft;

  Crypto? get selectedCryptoLeft => _selectedCryptoLeft;

  Crypto? _selectedCryptoRight;

  Crypto? get selectedCryptoRight => _selectedCryptoRight;

  Future<void> searchCryptos() async {
    notifyListeners();
    try {
      _cryptos = await searchCrypto.searchCryptos();
    } catch (e) {
    } finally {
      notifyListeners();
    }
  }

  void selectCryptoLeft(Crypto crypto) {
    _selectedCryptoLeft = crypto;
    notifyListeners();
  }

  void selectCryptoRight(Crypto crypto) {
    _selectedCryptoRight = crypto;
    notifyListeners();
  }
}
