import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodhub/presentation/utils/router/app_navigation.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBtHr-eIuemUfGNvRPuF0PAcZVgUmNVZZg",
            authDomain: "foodhub-6c0a6.firebaseapp.com",
            projectId: "foodhub-6c0a6",
            storageBucket: "foodhub-6c0a6.appspot.com",
            messagingSenderId: "565354713919",
            appId: "1:565354713919:web:60b87636fdb0f3f8ca398a"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(ProviderScope(child: FoodHub()));
}

class FoodHub extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) => LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, child!),
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
          );
        },
      ),
      debugShowCheckedModeBanner: false,
      title: 'FoodHub',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFE724C),
        primaryColor: Color(0xBFFFFFFF),
        hintColor: Color(0x80FFFFFF),
        hoverColor: Color(0xff1F1F1F),
      ),
      routerConfig: AppNavigation.router,
    );
  }
}
