import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weniatest/features/crypto/data/constants/networking.dart';
import 'package:weniatest/features/crypto/data/dtos/CryptoDTO.dart';

class CryptoRemoteDataSource {
  final http.Client client;

  CryptoRemoteDataSource(this.client);

  Future<List<CryptoDTO>> searchCrypto(String name) async {
    final request = http.Request(
      'GET',
      Uri.parse(
          '$COINGECKO_API_BASE_URL/coins/markets?vs_currency=usd&ids=$name'),
    );
    request.headers.addAll({
      'accept': 'application/json',
      'x-cg-pro-api-key': COINGECKO_API_KEY,
    });

    final response = await client.send(request);

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final List<dynamic> data = json.decode(responseBody);
      return data.map((json) => CryptoDTO.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load crypto');
    }
  }

  Future<List<CryptoDTO>> searchCryptos() async {
    final request = http.Request(
      'GET',
      Uri.parse('$COINGECKO_API_BASE_URL/coins/markets?vs_currency=usd'),
    );
    request.headers.addAll({
      'accept': 'application/json',
      'x-cg-pro-api-key': 'CG-7MKSuSWHNqxFQF3JSVAj1Gog',
    });

    final response = await client.send(request);

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final List<dynamic> data = json.decode(responseBody);
      return data.map((json) => CryptoDTO.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load crypto');
    }
  }
}
