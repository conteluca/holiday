import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({Key? key, required this.title, required this.icon})
      : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          const SizedBox(
            width: 7,
          ),
          Text(
            title,
            style: const TextStyle(),
          ),
        ],
      ),
    );
  }
}
