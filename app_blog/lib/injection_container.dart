import 'package:app_blog/features/home_blog/bloc/home_blog_bloc.dart';
import 'package:app_blog/features/home_blog/data/data_source/data_source.dart';
import 'package:app_blog/features/home_blog/data/repository/home_blog_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';

import 'features/home_blog/data/data_source/local_data_source.dart';

final sl = GetIt.instance;
void init() {
  //! Features
  //BLoC
  sl.registerFactory(
    () => HomeBlogBloc(homeBlogRepo: sl()),
  );

  // repo
  sl.registerLazySingleton(() => HomeBlogRepo(dataSource: sl()));

  sl.registerLazySingleton<DataSource>(() => LocalDataSource());

  // ? Core

  // * External
}
