import 'package:flutter/material.dart';

class ListtileWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const ListtileWidget({Key? key, required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      trailing: IconButton(
        color: Theme.of(context).highlightColor,
        onPressed: onPressed,
        icon: Icon(Icons.arrow_forward),
      ),
    );
  }
}
