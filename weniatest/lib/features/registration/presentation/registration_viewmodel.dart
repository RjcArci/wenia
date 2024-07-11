import 'package:flutter/material.dart';

class RegistrationViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void register(BuildContext context) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();
    Navigator.pushReplacementNamed(context, '/home');
  }
}
