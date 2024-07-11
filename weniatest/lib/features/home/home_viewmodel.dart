import 'package:flutter/material.dart';
import 'package:weniatest/features/crypto/domain/usecases/GetSavedCryptosUseCase.dart';

class HomeViewModel extends ChangeNotifier {
  final GetSavedCryptosUseCase getSavedCryptos;

  HomeViewModel({
    required this.getSavedCryptos,
  });

  Future<bool> checkForSavedCryptos() async {
    try {
      final savedCryptos = await getSavedCryptos.execute();
      return savedCryptos.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
