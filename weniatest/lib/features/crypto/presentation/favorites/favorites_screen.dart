import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weniatest/features/crypto/presentation/favorites/favorities_viewmodel.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<CryptoFavoritesViewModel>();
      viewModel.getFavoritesCryptos();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CryptoFavoritesViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: viewModel.isLoading
          ? Center(child: CircularProgressIndicator())
          : viewModel.cryptos.isEmpty
          ? Center(child: Text('No favorites yet'))
          : ListView.builder(
        itemCount: viewModel.cryptos.length,
        itemBuilder: (context, index) {
          final crypto = viewModel.cryptos[index];
          return ListTile(
            leading: Image.network(crypto.image),
            title: Text(crypto.name),
            subtitle: Text('Symbol: ${crypto.symbol}, Price: ${crypto.price}'),
          );
        },
      ),
    );
  }
}