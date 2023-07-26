import 'package:app_blog/features/home_blog/presentation/pages/home_blog_page.dart';
import 'package:flutter/material.dart';

import 'core/observers/app_bloc_observer.dart';
import 'features/home_blog/bloc/home_blog_bloc.dart';
import 'injection_container.dart' as di;

import 'injection_container.dart ';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  di.init();
  Bloc.observer = AppBlocOberver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Blog',
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        }),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => sl<HomeBlogBloc>(),
        child: const HomeBlogPage(),
      ),
    );
  }
}
