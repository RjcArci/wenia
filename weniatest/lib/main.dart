import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weniatest/di/service_locator.dart' as service_locator;
import 'package:weniatest/features/crypto/presentation/comparator/comparator_viewmodel.dart';
import 'package:weniatest/features/crypto/presentation/favorites/favorites_screen.dart';
import 'package:weniatest/features/crypto/presentation/favorites/favorities_viewmodel.dart';
import 'package:weniatest/features/crypto/presentation/search/search_screen.dart';
import 'package:weniatest/features/crypto/presentation/search/search_viewmodel.dart';
import 'package:weniatest/features/home/home_screen.dart';
import 'package:weniatest/features/home/home_viewmodel.dart';
import 'package:weniatest/features/profile/presentation/profile_screen.dart';
import 'package:weniatest/features/profile/presentation/profile_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await service_locator.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => service_locator.getIt<HomeViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => service_locator.getIt<CryptoFavoritesViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => service_locator.getIt<CryptoSearchViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => service_locator.getIt<CryptoComparatorViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => service_locator.getIt<ProfileViewModel>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Navigation Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
          '/search': (context) => SearchScreen(),
          '/favorites': (context) => FavoritesScreen(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
  }
}
