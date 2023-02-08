import 'package:batch_student_objbox_api/app/snackbar.dart';
import 'package:batch_student_objbox_api/repository/student_repo.dart';
import 'package:batch_student_objbox_api/screen/wearos/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';

class WatchLoginScreen extends StatefulWidget {
  const WatchLoginScreen({super.key});

  static const String route = "watchloginscreen";

  @override
  State<WatchLoginScreen> createState() => _WatchLoginScreenState();
}

class _WatchLoginScreenState extends State<WatchLoginScreen> {
  final _formKeyWatch = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  _login() async {
    final islogin = await StudentRepositoryImpl()
        .loginStudent(_usernameController.text, _passwordController.text);
    if (islogin) {
      // write here
      _goToAnotherPage();
    } else {
      _showMessage();
    }
  }

  _goToAnotherPage() {
    Navigator.pushNamed(context, WatchDashboardScreen.route);
  }

  _showMessage() {
    showSnackbar(context, 'Invalid username or password!', Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return WatchShape(
        builder: (BuildContext context, WearShape shape, Widget? child) {
      return AmbientMode(
        builder: (context, mode, child) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKeyWatch,
                  child: Column(children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(labelText: "Username"),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Password"),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKeyWatch.currentState!.validate()) {
                            _login();
                          }
                        },
                        child: const Text("Login"),
                      ),
                    )
                  ]),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
