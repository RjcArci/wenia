import 'package:weniatest/features/crypto/domain/entities/Crypto.dart';

class CryptoDTO {
  final String id;
  final String name;
  final String symbol;
  final double price;
  final String image;

  CryptoDTO({
    required this.id,
    required this.name,
    required this.symbol,
    required this.price,
    required this.image,
  });

  factory CryptoDTO.fromJson(Map<String, dynamic> json) {
    return CryptoDTO(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      price: (json['current_price'] is int)
          ? (json['current_price'] as int).toDouble()
          : (json['current_price'] is String)
          ? double.tryParse(json['current_price']) ?? 0.0
          : (json['current_price'] as double),
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'current_price': price,
      'image': image,
    };
  }

  Crypto toEntity() {
    return Crypto(
      id: id,
      name: name,
      symbol: symbol,
      price: price.toInt(),
      image: image,
    );
  }
}