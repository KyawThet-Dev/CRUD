import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/providers.dart';
import '../router/app_router.dart';

class AppWidget extends ConsumerWidget {
  AppWidget({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initializationProvider, (previous, next) {});
    return MaterialApp.router(
      title: 'Sample CRUD',
      theme: ThemeData(
        textTheme: const TextTheme(
          displaySmall: TextStyle(fontSize: 18),
          titleLarge: TextStyle(fontSize: 18),
          titleSmall: TextStyle(fontWeight: FontWeight.w400),
          bodyMedium: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, wordSpacing: 2),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
