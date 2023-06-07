import 'dart:async';

import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> animationPadding;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    Timer.periodic(Duration(seconds: 2), (timer) {
      timer.cancel();
      Navigator.of(context).pushReplacementNamed('/profile');
    });

    final curve = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animationPadding = Tween<double>(begin: 0, end: 250).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: animationPadding.value,
          child: Image.asset(
            'assets/images/portfolio.png',
          ),
        ),
      ),
    );
  }
}
