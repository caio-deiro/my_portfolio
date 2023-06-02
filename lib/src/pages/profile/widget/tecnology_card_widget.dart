import 'package:flutter/material.dart';

class TecnologyCardWidget extends StatelessWidget {
  final Image imageAsset;
  final String tecnologyName;
  const TecnologyCardWidget(
      {Key? key, required this.imageAsset, required this.tecnologyName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        alignment: Alignment.center,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: Theme.of(context).cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SizedBox(
                  width: 50,
                  child: imageAsset,
                ),
              ),
              Text(tecnologyName)
            ],
          ),
        ),
      ),
    );
  }
}
