import 'package:flutter/material.dart';

import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../../components/Button/Button.dart';
import '../../layouts/LoggedLayout/LoggedLayout.dart';

class ChangePassword extends StatefulWidget {
  static String id = '/ChangePasswordPage';

  const ChangePassword({super.key});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final newPasswordConfirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LoggedLayout(child:
    SizedBox(
      width: double.infinity,
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Senha Atual:"),
          TextField(
            controller: oldPasswordController,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
          const SizedBox(height: 20),
          const Text("Nova Senha:"),
          TextField(
            controller: newPasswordController,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
          const SizedBox(height: 20),
          const Text("Confirmar Nova Senha:"),
          TextField(
            controller: newPasswordConfirmController,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
          const SizedBox(height: 20),
          Button(
              onPressed: () async {

                final oldPassword = await SessionManager().get("password");
                if(oldPassword.toString() != oldPasswordController.value.text) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Senha atual incorreta')
                  ));
                  return;
                }

                if(newPasswordController.value.text != newPasswordConfirmController.value.text) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Nova senha e confirmação diferentes')
                  ));
                  return;
                }

                final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,12}$');

                if (!passwordRegex.hasMatch(newPasswordController.value.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Nova senha não atende aos requisitos de segurança')
                  ));
                  return;
                }

                await SessionManager().set("password", newPasswordController.value.text)
                  .then((value) =>
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text('Senha trocada com sucesso')
                    ))
                  );
              },
              buttonText: "Trocar Senha"
          )
        ],
      ),
    ),
    );
  }
}