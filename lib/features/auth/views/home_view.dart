import 'package:betahealth/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  void logOut(WidgetRef ref) async {
    ref.read(authControllerProvider.notifier).logOut();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider)!;
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Text(user.name),
            ElevatedButton(
              onPressed: () => logOut(ref),
              child: Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
