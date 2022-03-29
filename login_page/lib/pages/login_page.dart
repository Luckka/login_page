import 'package:flutter/material.dart';
import 'package:login_page/components/custom_bt_comp.dart';
import 'package:login_page/controllers/login_controller.dart';
import 'package:login_page/widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final LoginController _controler = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(28),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people,
                    size: MediaQuery.of(context).size.height * 0.3,
                  ),
                  TextFieldCustom(
                      label: 'login', onChanged: _controler.setLogin),
                  TextFieldCustom(
                    label: 'password',
                    onChanged: _controler.setPass,
                    obscureText: true,
                  ),
                  SizedBox(height: 15),
                  Custombtcomp(loginController: _controler)
                ],
              ),
            )));
  }
}
