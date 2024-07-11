import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weniatest/design_system/buttons/WeniaFilledButton.dart';
import 'package:weniatest/features/registration/presentation/registration_viewmodel.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegistrationViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<RegistrationViewModel>(
                    builder: (context, viewModel, child) {
                      return Column(
                        children: [
                          TextField(
                            controller: viewModel.nameController,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: viewModel.idController,
                            decoration: InputDecoration(
                              labelText: 'ID',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: viewModel.birthdateController,
                            decoration: InputDecoration(
                              labelText: 'Birthdate',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: viewModel.emailController,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: viewModel.passwordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                          ),
                          SizedBox(height: 32),
                          if (viewModel.errorMessage != null)
                            Text(
                              viewModel.errorMessage!,
                              style: TextStyle(color: Colors.red),
                            ),
                          if (viewModel.isLoading) CircularProgressIndicator(),
                          if (!viewModel.isLoading)
                            WeniaFilledButton(
                              onPressed: () {
                                viewModel.register(context);
                              },
                              text: "Register",
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
      ),
    );
  }
}
