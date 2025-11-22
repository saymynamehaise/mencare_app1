import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'shared/controllers/theme_controller.dart';
import 'features/shell/presentation/root_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeController = await ThemeController.bootstrap();
  runApp(
    ChangeNotifierProvider(
      create: (_) => themeController,
      child: const MenCareApp(),
    ),
  );
}

class MenCareApp extends StatelessWidget {
  const MenCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeController>().isDark;

    final baseDark = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xFF111111),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF2F8A8A),
        secondary: Color(0xFFB85A2F),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontFamily: 'Arial', color: Colors.white70),
      ),
    );

    final baseLight = ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF2F8A8A),
        secondary: Color(0xFFB85A2F),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontFamily: 'Arial', color: Colors.black87),
      ),
    );

    return MaterialApp(
      title: 'MenCare',
      debugShowCheckedModeBanner: false,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: baseLight,
      darkTheme: baseDark,
      home: const RootScreen(),
    );
  }
}
