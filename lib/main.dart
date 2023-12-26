import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final bool isDark = ref.watch(isDarkMode);
    final int selectedIndex = ref.watch(selectedIndexProvider);


    return MaterialApp.router(
      title: 'TESTING WIDGETS',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(isDark: isDark, selectedColor: selectedIndex).getTheme(),
    );
  }
}
