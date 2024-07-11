import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weniatest/features/crypto/presentation/comparator/comparator_screen.dart';
import 'package:weniatest/features/crypto/presentation/favorites/favorites_screen.dart';
import 'package:weniatest/features/crypto/presentation/search/search_screen.dart';
import 'package:weniatest/features/home/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _checkForSavedCryptos();
  }

  Future<void> _checkForSavedCryptos() async {
    final hasSavedCryptos =
        await context.read<HomeViewModel>().checkForSavedCryptos();
    if (hasSavedCryptos) {
      setState(() {
        _selectedIndex = 1;
      });
    }
  }

  static List<Widget> _widgetOptions = <Widget>[
    SearchScreen(),
    FavoritesScreen(),
    ComparatorScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.balance),
            label: 'Comparator',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
