import 'package:app_miscelanea/src/pages/profile/profile_controller.dart';
import 'package:app_miscelanea/src/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HabilitiesCardWidget extends StatefulWidget {
  const HabilitiesCardWidget({Key? key}) : super(key: key);

  @override
  State<HabilitiesCardWidget> createState() => _HabilitiesCardWidgetState();
}

class _HabilitiesCardWidgetState extends State<HabilitiesCardWidget> {
  final controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 140,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: controller.habilitiesList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var habilities = controller.habilitiesList[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      habilities.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TweenAnimationBuilder<double>(
                      curve: Curves.ease,
                      tween:
                          Tween<double>(begin: 0, end: habilities.skillLevel),
                      duration: Duration(seconds: 4),
                      builder: (context, value, __) => SizedBox(
                        width: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            minHeight: 10,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(primaryDark),
                            color: Colors.black87,
                            value: value,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
