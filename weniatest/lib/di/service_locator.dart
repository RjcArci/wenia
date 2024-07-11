import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weniatest/features/crypto/data/datasource/local/CryptoLocalDataSource.dart';
import 'package:weniatest/features/crypto/data/datasource/remote/CryptoRemoteDataSource.dart';
import 'package:weniatest/features/crypto/data/repositories/CryptoRepositoryImpl.dart';
import 'package:weniatest/features/crypto/domain/repositories/CryptoRepository.dart';
import 'package:weniatest/features/crypto/domain/usecases/GetSavedCryptosUseCase.dart';
import 'package:weniatest/features/crypto/domain/usecases/RemoveCryptoUseCase.dart';
import 'package:weniatest/features/crypto/domain/usecases/SaveCryptoUseCase.dart';
import 'package:weniatest/features/crypto/domain/usecases/SearchCryptoUseCase.dart';
import 'package:weniatest/features/crypto/presentation/comparator/comparator_viewmodel.dart';
import 'package:weniatest/features/crypto/presentation/favorites/favorities_viewmodel.dart';
import 'package:weniatest/features/crypto/presentation/search/search_viewmodel.dart';
import 'package:weniatest/features/home/home_viewmodel.dart';
import 'package:weniatest/features/login/data/repositories/AuthRepositoryImpl.dart';
import 'package:weniatest/features/login/domain/repositories/AuthRepository.dart';
import 'package:weniatest/features/login/domain/usecase/LoginUseCase.dart';
import 'package:weniatest/features/login/presentation/login_viewmodel.dart';
import 'package:weniatest/features/profile/presentation/profile_viewmodel.dart';
import 'package:weniatest/features/registration/data/repositories/RegistrationRepositoryImpl.dart';
import 'package:weniatest/features/registration/domain/repository/RegistrationRepository.dart';
import 'package:weniatest/features/registration/domain/usecases/RegistrationUseCase.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => CryptoRemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => CryptoLocalDataSource(sharedPreferences));

  getIt.registerLazySingleton<CryptoRepository>(
    () => CryptoRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(),
  );

  getIt.registerLazySingleton<RegistrationRepository>(
    () => RegistrationRepositoryImpl(),
  );

  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => RegistrationUseCase(getIt()));
  getIt.registerLazySingleton(() => SearchCryptoUseCase(getIt()));
  getIt.registerLazySingleton(() => GetSavedCryptosUseCase(getIt()));
  getIt.registerLazySingleton(() => SaveCryptoUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveCryptoUseCase(getIt()));

  getIt.registerFactory(() => LoginViewModel(
        loginUseCase: getIt(),
      ));

  getIt.registerFactory(() => HomeViewModel(
        getSavedCryptos: getIt(),
      ));

  getIt.registerFactory(() => CryptoFavoritesViewModel(
        getSavedCryptos: getIt(),
      ));

  getIt.registerFactory(() => CryptoSearchViewModel(
        searchCryptosUseCase: getIt(),
        saveCryptoUseCase: getIt(),
        removeCryptoUseCase: getIt(),
        getSavedCryptosUseCase: getIt(),
      ));

  getIt.registerFactory(() => CryptoComparatorViewModel(
        searchCrypto: getIt(),
      ));

  getIt.registerFactory(() => ProfileViewModel(
        searchCryptosUseCase: getIt(),
      ));
}
