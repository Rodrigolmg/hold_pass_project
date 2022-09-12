import 'package:get_it/get_it.dart';
import 'package:hold_pass_en/data/datasources/app_local_database.dart';
import 'package:hold_pass_en/data/repositories/password_repository_impl.dart';
import 'package:hold_pass_en/domain/repositories/password_repository.dart';
import 'package:hold_pass_en/domain/usecases/delete_password_usecase.dart';
import 'package:hold_pass_en/domain/usecases/edit_password_usecase.dart';
import 'package:hold_pass_en/domain/usecases/register_password_usecase.dart';
import 'package:hold_pass_en/domain/usecases/get_passwords_usecase.dart';

final sl = GetIt.instance;

void init(){

  sl.registerSingletonAsync(() => AppLocalDatabase.instance.database);
  sl.registerLazySingleton<PasswordRepository>(() => PasswordRepositoryImpl());

  sl.registerLazySingleton(() => RegisterPasswordUsecase(repository: sl()));
  sl.registerLazySingleton(() => DeletePasswordUsecase(repository: sl()));
  sl.registerLazySingleton(() => EditPasswordUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetPasswordsUsecase(repository: sl()));

}