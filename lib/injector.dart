import 'package:get_it/get_it.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// import 'package:emodule_fe/presentation/bloc/empty/empty_cubit.dart';
// import 'package:emodule_fe/presentation/bloc/dashboard/dashboard_cubit.dart';
// import 'package:emodule_fe/presentation/bloc/dashboard/dashboard_cubit.dart';
//
// import 'package:emodule_fe/domain/usecase/dashboard.dart';
// import 'package:emodule_fe/domain/usecase/authentication.dart';
//
// import 'package:emodule_fe/domain/repository/dashboard_repository.dart';
// import 'package:emodule_fe/domain/repository/authentication_repository.dart';
//
// import 'package:emodule_fe/data/repository/dashboard_repository_imp.dart';
// import 'package:emodule_fe/data/repository/authentication_repository_imp.dart';
//
// import 'package:emodule_fe/data/source/dashboard_remote_data_source.dart';
// import 'package:emodule_fe/data/source/authentication_remote_data_source.dart';
// import 'package:emodule_fe/data/source/authentication_secure_data_source.dart';
//
// import 'package:emodule_fe/data/service/api_service.dart';
// import 'package:emodule_fe/data/service/secure_service.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  // IOClient ioClient = await SSLPinning.ioClient;

  // // bloc
  // getIt.registerFactory<EmptyCubit>(() => EmptyCubit(
  //   authenticationUseCase: getIt(),
  // ));
  // getIt.registerFactory<DashboardCubit>(() => DashboardCubit(
  //   dashboardUseCase: getIt(),
  // ));
  //
  // // usecase
  // getIt.registerLazySingleton<DashboardUseCase>(() => DashboardUseCase(
  //   getIt(),
  // ));
  // getIt.registerLazySingleton<AuthenticationUseCase>(() => AuthenticationUseCase(
  //   getIt(),
  // ));
  //
  // // repository (abstract class)
  // getIt.registerLazySingleton<DashboardRepository>(() => DashboardRepositoryImp(
  //   remote: getIt(),
  // ));
  // getIt.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImp(
  //   remote: getIt(),
  //   secure: getIt(),
  // ));
  //
  // // source (abstract class)
  // getIt.registerLazySingleton<DashboardRemoteDataSource>(
  //   () => DashboardRemoteDataSourceImp(
  //     getIt(),
  // ));
  // getIt.registerLazySingleton<AuthenticationRemoteDataSource>(
  //   () => AuthenticationRemoteDataSourceImp(
  //     getIt(),
  // ));
  //
  // // secure source
  // getIt.registerLazySingleton<AuthenticationSecureDataSource>(
  //   () => AuthenticationSecureDataSourceImp(
  //     getIt(),
  // ));
  //
  // // service
  // getIt.registerLazySingleton<ApiService>(() => ApiService(
  //   httpClient: getIt(),
  // ));
  //
  // // external
  // getIt.registerLazySingleton<SecureService>(() => SecureService(
  //   secureStorage: getIt(),
  // ));

  // getIt.registerFactory<IOClient>(() => ioClient);
  getIt.registerFactory<http.Client>(() => http.Client());
  getIt.registerFactory<FlutterSecureStorage>(() => FlutterSecureStorage());
}
