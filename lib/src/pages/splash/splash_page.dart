import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:fast_location/src/shared/routes.dart';
import 'package:fast_location/src/shared/colors.dart' as app_colors;

import 'package:fast_location/src/pages/splash/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _controller = SplashController();

  @override
  void initState() {
    super.initState();
    _controller.startApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: app_colors.Colors.primary,
      body: Observer(
        builder: (_) {
          if (_controller.isLoading) {
            return const Center(
              child: Text(
                "FAST LOCATION",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: app_colors.Colors.onPrimary,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            );
          }

          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacementNamed(Routes.basePage);
          });

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
