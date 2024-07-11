import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weniatest/design_system/buttons/WeniaFilledButton.dart';
import 'package:weniatest/design_system/buttons/WeniaOutlinedButton.dart';
import 'login_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Wenia Test", style: TextStyle(fontSize: 24)),
                // Add your logo asset here
                SizedBox(height: 32),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 32),
                Consumer<LoginViewModel>(
                  builder: (context, viewModel, child) {
                    return Column(
                      children: [
                        if (viewModel.errorMessage != null)
                          Text(
                            viewModel.errorMessage!,
                            style: TextStyle(color: Colors.red),
                          ),
                        if (viewModel.isLoading) CircularProgressIndicator(),
                        if (!viewModel.isLoading)
                          Column(
                            children: [
                              WeniaFilledButton(
                                onPressed: () {
                                  viewModel.login(
                                      context,
                                      _usernameController.text,
                                      _passwordController.text);
                                },
                                text: 'Login',
                              ),
                              SizedBox(height: 16),
                              WeniaOutlinedButton(
                                onPressed: () {
                                  viewModel.register(context);
                                },
                                text: 'Register',
                              ),
                            ],
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
