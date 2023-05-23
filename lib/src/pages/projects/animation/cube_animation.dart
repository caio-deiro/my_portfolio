import 'dart:math';

import 'package:app_miscelanea/src/shared/widgets/app_base.dart';
import 'package:flutter/material.dart';

class CubeAnimation extends StatefulWidget {
  const CubeAnimation({Key? key}) : super(key: key);

  @override
  State<CubeAnimation> createState() => _CubeAnimationState();
}

class _CubeAnimationState extends State<CubeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<AlignmentGeometry> animationAlignment;
  late Animation<AlignmentGeometry> animationAlignment2;
  late Animation<double> rotateAnimation;
  late Animation<double> paddingAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);

    animationAlignment = Tween<AlignmentGeometry>(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutCubic,
    ));

    rotateAnimation = Tween<double>(
      begin: 0,
      end: 4,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutCubic,
    ));

    animationAlignment2 = Tween<AlignmentGeometry>(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutCubic,
    ));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBase(
      title: 'Animação cubo',
      child: Center(
          child: Container(
              alignment: Alignment.center,
              width: 200,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: animationAlignment.value,
                    child: RotationTransition(
                      turns: rotateAnimation,
                      child: Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade600,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: rotateAnimation,
                    child: Container(
                      height: 40,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Align(
                    alignment: animationAlignment2.value,
                    child: RotationTransition(
                      turns: rotateAnimation,
                      child: Container(
                        height: 40,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade600,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}
