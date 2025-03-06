import 'package:diet_chaiyoo/app/shared_prefs/token_shared_prefs.dart';
import 'package:diet_chaiyoo/core/network/api_service.dart';
import 'package:diet_chaiyoo/core/network/hive_service.dart';
import 'package:diet_chaiyoo/features/auth/data/data_source/local_data_source/auth_local_data_source.dart';
import 'package:diet_chaiyoo/features/auth/data/data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:diet_chaiyoo/features/auth/data/repository/auth_local_repository/auth_local_repository.dart';
import 'package:diet_chaiyoo/features/auth/data/repository/auth_remote_repository/auth_remote_repository.dart';
import 'package:diet_chaiyoo/features/auth/domain/repository/auth_repository.dart';
import 'package:diet_chaiyoo/features/auth/domain/use_case/login_user_usecase.dart';
import 'package:diet_chaiyoo/features/auth/domain/use_case/register_user_usecase.dart';
import 'package:diet_chaiyoo/features/auth/domain/use_case/upload_image_usecase.dart';
import 'package:diet_chaiyoo/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:diet_chaiyoo/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:diet_chaiyoo/features/home/presentation/view_model/home_cubit.dart';
import 'package:diet_chaiyoo/features/personalisation/data/data_source/userPreferences_remote_data_source.dart';
import 'package:diet_chaiyoo/features/personalisation/data/repository/userPreferences_repository.dart';
import 'package:diet_chaiyoo/features/personalisation/domain/repository/userPreferences_repository.dart';
import 'package:diet_chaiyoo/features/personalisation/domain/use_case/userPreference_usecase.dart';
import 'package:diet_chaiyoo/features/personalisation/presentation/view_model/user_preference_bloc.dart';
import 'package:diet_chaiyoo/features/splash/presentation/view_model/splash_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // First initialize hive service
  await _initHiveService();
  await _initApiService();
  await _initSharedPrefs();
  await _initSplashDependencies();
  await _initUserPreferencesDependencies();
  await _initHomeDependencies();
  await __initRegisterDependencies();
  await _initLoginDependencies();
  // await _initOnboardingDependency();
}

_initSharedPrefs() async {
  final sharedPreferences =
      await SharedPreferences.getInstance(); // Initialize SharedPreferences
  getIt.registerLazySingleton<SharedPreferences>(
    () => sharedPreferences,
  );

  getIt.registerLazySingleton<TokenSharedPrefs>(
    () => TokenSharedPrefs(
        getIt<SharedPreferences>()), // Pass the required argument
  );
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initApiService() {
  getIt.registerLazySingleton<Dio>(
    () => ApiService(Dio()).dio,
  );
}

// _initSharedPrefs() async {
//   final sharedPrefs = await SharedPreferences.getInstance();
//   getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
// }

_initLoginDependencies() async {
  //  getIt.registerLazySingleton<TokenSharedPrefs>(
  //   () => TokenSharedPrefs(getIt<SharedPreferences>()));

  getIt.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(
      getIt<AuthRemoteRepository>(),
    ),
  );

  // Register LoginBloc
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUseCase: getIt<LoginUsecase>(),
    ),
  );
}

// _initOnboardingDependency()async{
//     getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());

// }

__initRegisterDependencies() {
  // Register AuthLocalDataSource
  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSource(getIt<HiveService>()),
  );
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(getIt<Dio>()));

  getIt.registerLazySingleton<AuthLocalRepository>(
      () => AuthLocalRepository(getIt()));

  getIt.registerLazySingleton<AuthRemoteRepository>(() => AuthRemoteRepository(
      authRemoteDataSource: getIt<AuthRemoteDataSource>()));

  // Register IAuthRepository
  getIt.registerLazySingleton<IAuthRepository>(
    () => AuthLocalRepository(getIt<AuthLocalDataSource>()),
  );

  // Register RegisterUserUsecase
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<AuthRemoteRepository>()),
  );

  getIt.registerLazySingleton<UploadImageUsecase>(
      () => UploadImageUsecase(repository: getIt<AuthRemoteRepository>()));

  // Register RegisterBloc
  getIt.registerFactory<RegisterBloc>(
    () => RegisterBloc(
      registerUseCase: getIt<RegisterUseCase>(),
      uploadImageUsecase: getIt<UploadImageUsecase>(),
    ),
  );
}

_initSplashDependencies() async {
  getIt.registerLazySingleton<SplashCubit>(() => SplashCubit(getIt()));
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

_initUserPreferencesDependencies() async {
  // =========================== Data Source ===========================
  getIt.registerLazySingleton<UserPreferencesRemoteDataSource>(
    () => UserPreferencesRemoteDataSource(
        dio: getIt<Dio>(),
        tokenSharedPrefs: getIt<
            TokenSharedPrefs>()), // Register UserPreferences Remote Data Source
  );

  // =========================== Repository ===========================
  getIt.registerLazySingleton<IUserPreferencesRepository>(
    () => UserPreferencesRemoteRepository(
        remoteDataSource: getIt<
            UserPreferencesRemoteDataSource>()), // Register UserPreferences Repository
  );

//   // =========================== Usecases ===========================
//   getIt.registerLazySingleton<GetUserPreferencesUseCase>(
//     () => GetUserPreferencesUseCase(userPreferencesRepository: getIt<IUserPreferencesRepository>()), // Usecase for getting user preferences
//   );
  getIt.registerLazySingleton<UpdateUserPreferencesUseCase>(
    () => UpdateUserPreferencesUseCase(
        userPreferencesRepository: getIt<IUserPreferencesRepository>()),
  );
//   // =========================== Bloc ===========================

  // getIt.registerLazySingleton<UpdateUserPreferencesUseCase>(
  //   () => UpdateUserPreferencesUseCase(
  //       userPreferencesRepository: getIt<IUserPreferencesRepository>()),
  // );

  // =========================== Bloc ===========================
  getIt.registerFactory<UserPreferencesBloc>(
    () => UserPreferencesBloc(
      updateUserPreferencesUseCase: getIt<UpdateUserPreferencesUseCase>(),
    ),
  );
//   getIt.registerFactory<UserPreferencesBloc>(
//     () => UserPreferencesBloc(getUserPreferencesUseCase: getIt<GetUserPreferencesUseCase>()), // UserPreferencesBloc to manage UserPreferences State
//   );
}
