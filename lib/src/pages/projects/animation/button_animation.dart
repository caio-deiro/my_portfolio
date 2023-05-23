import 'package:flutter/material.dart';

class ButtonAnimation extends StatefulWidget {
  const ButtonAnimation({Key? key}) : super(key: key);

  @override
  State<ButtonAnimation> createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controllerAnimation;

  late Animation<Color?> colorAnimation;
  late Animation<double> radiusAnimation;
  late Animation<AlignmentGeometry> alignAnimation;
  late Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();
    controllerAnimation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    colorAnimation = ColorTween(
      begin: Colors.indigo,
      end: Colors.lime,
    ).animate(controllerAnimation)
      ..addListener(() {
        setState(() {});
      });

    radiusAnimation = Tween<double>(
      begin: 50,
      end: 0,
    ).animate(controllerAnimation)
      ..addListener(() {
        setState(() {});
      });
    widthAnimation = Tween<double>(
      begin: 50,
      end: 150,
    ).animate(controllerAnimation)
      ..addListener(() {
        setState(() {});
      });

    alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.bottomRight,
      end: Alignment.topCenter,
    ).animate(controllerAnimation)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    controllerAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animação explicita de botao.'),
        ),
        body: Stack(
          children: [
            Center(
              child: Text(
                'Aqui aprendi como controlar animações explicitamente '
                'com o uso do Animated controller e da classe Tween , tendo total controle '
                'de animação e efeitos (curvas) sobre o widget desejado.',
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: alignAnimation.value,
              child: GestureDetector(
                onTap: () => controllerAnimation.isCompleted
                    ? controllerAnimation.reverse()
                    : controllerAnimation.forward(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: widthAnimation.value,
                    decoration: BoxDecoration(
                        color: colorAnimation.value,
                        borderRadius:
                            BorderRadius.circular(radiusAnimation.value)),
                    child: Text('clique'),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
