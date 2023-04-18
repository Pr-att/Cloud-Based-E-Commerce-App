import 'package:amazon_clone/constants/constants.dart';
import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';

// Used for viewing in almost every possible screens.
// import 'package:device_preview/device_preview.dart';
// void main() => runApp(
//       DevicePreview(
//         builder: (context) => const MyApp(),
//       ),
//     );

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
        home: const AuthScreen());
  }
}
