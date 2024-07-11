import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weniatest/features/crypto/domain/usecases/SearchCryptoUseCase.dart';

class ProfileViewModel extends ChangeNotifier {
  final SearchCryptoUseCase searchCryptosUseCase;

  ProfileViewModel({
    required this.searchCryptosUseCase,
  });

  // Profile Data
  String _name = '';
  String get name => _name;

  DateTime _birthday = DateTime.now();
  DateTime get birthday => _birthday;

  String _id = '';
  String get id => _id;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> loadProfile() async {
    final prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('name') ?? '';
    _birthday = DateTime.tryParse(prefs.getString('birthday') ?? '') ?? DateTime.now();
    _id = prefs.getString('id') ?? '';
    notifyListeners();
  }

  Future<void> saveProfile(String name, DateTime birthday, String id) async {
    final prefs = await SharedPreferences.getInstance();
    _name = name;
    _birthday = birthday;
    _id = id;
    await prefs.setString('name', _name);
    await prefs.setString('birthday', _birthday.toIso8601String());
    await prefs.setString('id', _id);
    notifyListeners();
  }
}
