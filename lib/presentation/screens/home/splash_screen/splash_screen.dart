import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      useImmersiveMode: true,
      duration: const Duration(seconds: 5),
      onEnd: () => GoRouter.of(context).go('/welcome_screen'),
      backgroundColor: const Color(0xffFE724C),
      splashScreenBody: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/splash_icon.svg', width: 100, height: 100),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'FOOD',
                      style: TextStyle(
                        fontFamily: 'Phosphate',
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ).animate().fadeIn(duration: 1000.ms),
                    Text(
                      'HUB',
                      style: TextStyle(
                        fontFamily: 'Phosphate',
                        fontSize: 40,
                        color: const Color.fromARGB(149, 255, 255, 255),
                      ),
                    ).animate().fadeIn(duration: 1000.ms),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
