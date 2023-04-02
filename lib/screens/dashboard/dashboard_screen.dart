import 'package:auth_riverpod/features/user/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ref.watch(getAuthenticatedUserProvider).when(
                  loading: () => const CircularProgressIndicator(),
                  data: (user) => Text("Welcome, ${user.username}"),
                  error: (error, stackTrace) {
                    debugPrint(error.toString());
                    return const Text('User information is not available!');
                  },
                ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () async {
                  final isCleared = await ref.read(resetStorage);
                  debugPrint("IS CLEARED ${isCleared}");
                  if (isCleared) {
                    Navigator.popAndPushNamed(context, 'Login');
                  }
                },
                child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}
