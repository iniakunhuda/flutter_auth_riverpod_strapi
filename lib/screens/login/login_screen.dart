import 'package:auth_riverpod/features/user/providers/user_controller.dart';
import 'package:auth_riverpod/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// void main() => runApp(const LoginScreen());

class LoginScreen extends StatefulHookConsumerWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isHidden = true;

  @override
  void initState() {
    email.text = "miftahulinc@gmail.com"; //innitail value of text field
    password.text = "huda12345";
    super.initState();
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void showSnackbar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: const InputDecoration(
                labelText: "Email",
                icon: Icon(Icons.people), //icon at head of input
              ),
            ),
            TextField(
              controller: password,
              obscureText: _isHidden,
              decoration: InputDecoration(
                icon: const Icon(Icons.lock), //icon at head of input
                //prefixIcon: Icon(Icons.people), //you can use prefixIcon property too.
                labelText: "Password",
                suffixIcon: IconButton(
                  onPressed: _togglePasswordView,
                  icon: Icon(
                    _isHidden ? Icons.visibility : Icons.visibility_off,
                  ),
                ), //icon at tail of input
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(userControllerProvider.notifier)
                          .login(
                            email: email.text,
                            password: password.text,
                          )
                          .then(
                            (res) => {
                              res.fold(
                                (l) => {
                                  showSnackbar(context, l),
                                },
                                (r) => {
                                  Navigator.pushReplacementNamed(
                                      context, 'Home'),
                                },
                              ),
                            },
                          );
                    },
                    child: const Text("Login"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
