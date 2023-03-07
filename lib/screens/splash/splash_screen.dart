import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medusa/screens/home/home_screen.dart';
import 'package:medusa/widgets/widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () => Navigator.pushNamed(context, HomeScreen.routeName));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Image(
              image: AssetImage('assets/logo.png'),
              height: 225,
              width: 225,
            ),
          )
        ],
      ),
    );
  }
}
