import 'package:flutter/material.dart';
import 'package:weniatest/features/login/domain/usecase/LoginUseCase.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  LoginViewModel({
    required this.loginUseCase,
  });

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void login(BuildContext context, String username, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    // Simulate a login call
    await Future.delayed(Duration(seconds: 2));

    if (username == 'user' && password == 'password') {
      _isLoading = false;
      notifyListeners();
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      _isLoading = false;
      _errorMessage = 'Invalid username or password';
      notifyListeners();
    }
  }

  void register(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }
}
