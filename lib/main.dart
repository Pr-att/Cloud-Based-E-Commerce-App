import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:amazon_clone/router.dart';
import 'package:amazon_clone/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Used for viewing in almost every possible screens.
// import 'package:device_preview/device_preview.dart';
// void main() => runApp(
//       DevicePreview(
//         builder: (context) => const MyApp(),
//       ),
//     );

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
      ),
    ], child: const MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Used for viewing in almost every possible screens.
      // useInheritedMediaQuery: true,
      //   locale: DevicePreview.locale(context),
      //   builder: DevicePreview.appBuilder,
      onGenerateRoute: (settings) => generateRoute(settings),
      title: 'Amazon Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.backgroundColor,
          colorScheme: const ColorScheme.light(
            primary: Constants.secondaryColor,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          useMaterial3: true),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const HomeScreen()
          : const AuthScreen(),
    );
  }
}
