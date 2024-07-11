import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weniatest/features/crypto/presentation/search/search_viewmodel.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<CryptoSearchViewModel>();
      viewModel.searchCryptos();
    });
  }

  final TextEditingController _searchController = TextEditingController();

  void _searchCryptos() {
    final viewModel = context.read<CryptoSearchViewModel>();
    viewModel.searchCryptoByName(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CryptoSearchViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Cryptos'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          IconButton(
            icon: Icon(viewModel.isDescending
                ? Icons.arrow_downward
                : Icons.arrow_upward),
            onPressed: () {
              viewModel.toggleSortOrder();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Cryptos',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchCryptos,
                ),
              ),
              onSubmitted: (_) => _searchCryptos(),
            ),
          ),
          Expanded(
            child: viewModel.isLoading
                ? Center(child: CircularProgressIndicator())
                : viewModel.cryptos.isEmpty
                    ? Center(child: Text('No cryptos found'))
                    : ListView.builder(
                        itemCount: viewModel.cryptos.length,
                        itemBuilder: (context, index) {
                          final crypto = viewModel.cryptos[index];
                          final isFavorite = viewModel.isFavorite(crypto);
                          return ListTile(
                            leading: Image.network(crypto.image),
                            title: Text(crypto.name),
                            subtitle: Text(
                                'Symbol: ${crypto.symbol}, Price: ${crypto.price}'),
                            trailing: IconButton(
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorite ? Colors.red : null,
                              ),
                              onPressed: () {
                                if (isFavorite) {
                                  viewModel.removeFavorite(crypto);
                                } else {
                                  viewModel.addFavorite(crypto);
                                }
                              },
                            ),
                          );
                        },
                      ),
          ),
          if (viewModel.error != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                viewModel.error!,
                style: TextStyle(color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}
