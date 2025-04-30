import 'dart:convert';

import 'package:assignment/ui/screens/update_profile_screen.dart';
import 'package:flutter/material.dart';

import '../controllers/auth_controller.dart';
import '../screens/login_screen.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TMAppBar({
    super.key,
    this.fromProfileScreen,
  });

  final bool? fromProfileScreen;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: () {
          if (fromProfileScreen ?? false) {
            return;
          }
          _onTapProfileSection(context);
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: _shouldShowImage(AuthController.userModel?.photo)
                  ? MemoryImage(
                      base64Decode(AuthController.userModel?.photo ?? ''),
                    )
                  : null,
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AuthController.userModel?.fulName ?? 'Unknown',
                    style: textTheme.bodyLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    AuthController.userModel?.email ?? 'Unknown',
                    style: textTheme.bodySmall?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: () => _onTapLogOutButton(context),
                icon: const Icon(Icons.logout))
          ],
        ),
      ),
    );
  }

  bool _shouldShowImage(String? photo) {
    return photo != null && photo.isNotEmpty;
  }

  void _onTapProfileSection(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => UpdateProfileScreen()
        ),
    ).then((updatedUserModel) {
      if (updatedUserModel != null) {
        // Force a rebuild of the app bar by calling setState if this is used in a StatefulWidget
        // Alternatively, use a state management solution like Provider or Riverpod
        // For now, we'll just update the AuthController and let it handle the rest
        AuthController.userModel = updatedUserModel;
        // Trigger a rebuild of the app bar
        (context as Element).markNeedsBuild();
      }
    });
  }

  Future<void> _onTapLogOutButton(BuildContext context) async {
    await AuthController.clearUserData();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (predicate) => false);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
