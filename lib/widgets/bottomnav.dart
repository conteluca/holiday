import 'package:flutter/material.dart';
import 'package:holiday/screens/notification.dart';
import 'package:holiday/screens/profile.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.background,
      clipBehavior: Clip.antiAlias,
      notchMargin: 5.0,
      shape: const CircularNotchedRectangle(),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
              )),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationPage()),
              );
            },
            icon: const Icon(
              Icons.notifications,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            icon: const Icon(
              Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
