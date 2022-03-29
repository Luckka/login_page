import 'package:flutter/material.dart';
import 'package:login_page/controllers/login_controller.dart';

class Custombtcomp extends StatelessWidget {
  const Custombtcomp({Key? key, required this.loginController})
      : super(key: key);

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: loginController.inLoader,
        builder: (_, inLoader, __) => inLoader
            ? CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  loginController.auth().then((result) {
                    if (result) {
                      Navigator.of(context).pushReplacementNamed('/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: const Text('falha ao fazer login'),
                        duration: const Duration(seconds: 5),
                      ));
                    }
                  });
                },
                child: Text('Login'),
              ));
  }
}
