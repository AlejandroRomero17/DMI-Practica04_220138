import 'package:flutter/material.dart';
import 'package:widget_app_220138/presentation/screens/discover/discover_screen.dart';
import 'package:widget_app_220138/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:widget_app_220138/presentation/providers/discover_provider.dart';



void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(lazy: false, create: (_) => DiscoverProvider()..loadNextPage())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
