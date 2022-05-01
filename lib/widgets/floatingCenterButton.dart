import 'package:flutter/material.dart';

class FloatingCenterButton extends StatelessWidget {
  const FloatingCenterButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      onPressed: () {},
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      tooltip: 'Increment',
      child: Icon(
        Icons.add,
        size: 30,
        color: Colors.white,
      ),
      elevation: 15,
    );
  }
}
