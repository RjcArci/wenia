import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weniatest/features/crypto/data/dtos/CryptoDTO.dart';

class CryptoLocalDataSource {
  final SharedPreferences sharedPreferences;

  CryptoLocalDataSource(this.sharedPreferences);

  Future<void> saveCrypto(CryptoDTO crypto) async {
    final jsonString = json.encode(crypto.toJson());
    await sharedPreferences.setString('crypto_${crypto.id}', jsonString);
  }

  Future<List<CryptoDTO>> getSavedCryptos() async {
    final keys = sharedPreferences
        .getKeys()
        .where((key) => key.startsWith('crypto_'))
        .toList();

    print('keys: $keys');
    final List<CryptoDTO> cryptos = [];

    for (String key in keys) {
      final jsonString = sharedPreferences.getString(key);
      print('jsonString: $jsonString');
      if (jsonString != null) {
        final Map<String, dynamic> jsonMap = json.decode(jsonString);
        print('jsonMap: $jsonMap');
        cryptos.add(CryptoDTO.fromJson(jsonMap));
      }
    }

    return cryptos;
  }

  Future<void> removeCrypto(String id) async {
    await sharedPreferences.remove('crypto_$id');
  }
}
