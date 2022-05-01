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
      color: Theme.of(context).colorScheme.primary,
      clipBehavior: Clip.antiAlias,
      // notchMargin: 5.0,
      // shape: const CircularNotchedRectangle(),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.all(12),
            iconSize: 30,
            onPressed: () {},
            color: Theme.of(context).colorScheme.onPrimary,
            icon: const Icon(
              Icons.menu,
            ),
          ),
          const Spacer(),
          IconButton(
            padding: EdgeInsets.all(12),
            iconSize: 30,
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications,
            ),
          ),
          IconButton(
            padding: EdgeInsets.all(12),
            iconSize: 30,
            color: Theme.of(context).colorScheme.onPrimary,
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
