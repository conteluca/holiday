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
      tooltip: 'Increment',
      child: const Icon(
        Icons.add,
        size: 30,
      ),
      elevation: 15,
    );
  }
}
