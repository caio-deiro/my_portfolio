import 'package:app_miscelanea/src/shared/service/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBase extends StatelessWidget {
  final String title;
  final Widget child;
  const AppBase({Key? key, required this.child, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 14),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title, style: Theme.of(context).textTheme.displayLarge),
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            GestureDetector(
              onTap: () {
                context.read<ThemeService>().changeTheme();
              },
              child: SizedBox(
                height: 24,
                width: 24,
                child: Image.asset(
                  'assets/icons/Icon-awesome-moon.png',
                  fit: BoxFit.scaleDown,
                  color: Theme.of(context).highlightColor,
                ),
              ),
            ),
          ],
        ),
        body: child,
      ),
    );
  }
}
