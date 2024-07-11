import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weniatest/features/crypto/domain/entities/Crypto.dart';
import 'package:weniatest/features/crypto/presentation/comparator/comparator_viewmodel.dart';

class ComparatorScreen extends StatefulWidget {
  @override
  _ComparatorScreenState createState() => _ComparatorScreenState();
}

class _ComparatorScreenState extends State<ComparatorScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<CryptoComparatorViewModel>();
      if (viewModel.cryptos.isEmpty) viewModel.searchCryptos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CryptoComparatorViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Comparator'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<Crypto>(
                    hint: Text('Select Crypto'),
                    value: viewModel.selectedCryptoLeft,
                    onChanged: (Crypto? newValue) {
                      if (newValue != null) {
                        viewModel.selectCryptoLeft(newValue);
                      }
                    },
                    items: viewModel.cryptos
                        .map<DropdownMenuItem<Crypto>>((Crypto value) {
                      return DropdownMenuItem<Crypto>(
                        value: value,
                        child: Row(
                          children: [
                            Image.network(
                              value.image,
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 8),
                            Text(value.symbol),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: viewModel.selectedCryptoLeft != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                    viewModel.selectedCryptoLeft!.image),
                                Text(
                                    'Name: ${viewModel.selectedCryptoLeft!.name}'),
                                Text(
                                    'Symbol: ${viewModel.selectedCryptoLeft!.symbol}'),
                                Text(
                                    'Price: ${viewModel.selectedCryptoLeft!.price}'),
                              ],
                            ),
                          )
                        : Text('Select a crypto'),
                  ),
                ),
              ],
            ),
          ),
          VerticalDivider(width: 1),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<Crypto>(
                    hint: Text('Select Crypto'),
                    value: viewModel.selectedCryptoRight,
                    onChanged: (Crypto? newValue) {
                      if (newValue != null) {
                        viewModel.selectCryptoRight(newValue);
                      }
                    },
                    items: viewModel.cryptos
                        .map<DropdownMenuItem<Crypto>>((Crypto value) {
                      return DropdownMenuItem<Crypto>(
                        value: value,
                        child: Row(
                          children: [
                            Image.network(
                              value.image,
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(width: 8),
                            Text(value.symbol),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: viewModel.selectedCryptoRight != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                    viewModel.selectedCryptoRight!.image),
                                Text(
                                    'Name: ${viewModel.selectedCryptoRight!.name}'),
                                Text(
                                    'Symbol: ${viewModel.selectedCryptoRight!.symbol}'),
                                Text(
                                    'Price: ${viewModel.selectedCryptoRight!.price}'),
                              ],
                            ),
                          )
                        : Text('Select a crypto'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
