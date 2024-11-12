import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      useImmersiveMode: true,
      duration: const Duration(seconds: 2),
      onEnd: () => GoRouter.of(context).go('/home_screen'),
      backgroundColor: const Color(0xffFE724C),
      splashScreenBody: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/splash_icon.svg', width: 150, height: 150)
                .animate()
                .rotate(duration: 1000.ms),
          ],
        ),
      ),
    );
  }
}
