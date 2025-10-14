import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_app_220138/presentation/screens/discover/discover_screen.dart';
import 'package:widget_app_220138/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:widget_app_220138/presentation/providers/discover_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Ocultar la barra de estado para pantalla completa
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider()..loadNextPage(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const SplashScreen(),
      ),
    );
  }
}

// Splash Screen a PANTALLA COMPLETA
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      // Restaurar la barra de estado
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DiscoverScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash/splash_image.png'),
            fit: BoxFit.cover, // Ocupa TODA la pantalla
          ),
        ),
      ),
    );
  }
}
