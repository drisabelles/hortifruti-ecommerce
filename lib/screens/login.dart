import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_text_field.dart';
import 'package:flutter_app/screens/profile.dart';
import 'package:string_validator/string_validator.dart' as validator;

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  bool obscuredText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      'Hortifruti E-commerce',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        fontSize: 20,
                        color: Colors.green 
                      ),
                    ),
                    const SizedBox(height: 15),
                    Image.asset(
                      'assets/images/stand.png', 
                      height: 200,
                      width: 200
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      label: 'Nome de usuário',
                      hint: 'Digite o seu nome de usuário',
                      obscureText: false,
                      icon: Icons.person_outline,
                      suffix: null,
                      validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                      onSaved: null
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      label: 'Senha',
                      hint: 'Digite a sua senha',
                      obscureText: obscuredText = !obscuredText,
                      icon: Icons.vpn_key,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                        }
                        if (text.length < 8) {
                          return 'Senha com número de caracteres insuficiente';
                        }
                      },
                      onSaved: null,
                      suffix: IconButton(
                        onPressed: (){
                          setState(() {
                            obscuredText = obscuredText;
                          });
                        }, 
                        icon: Icon(
                          obscuredText ? Icons.visibility : Icons.visibility_off
                        ),
                      )
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigator.of(context).pushNamed('/home')  ; 
                          }
                        },
                        child: const Text(
                          'Entrar', 
                          style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500)
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register');
                        },
                        child: const Text(
                          'Não tem uma conta? Cadastre-se',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          )
                        ),
                      ),
                    ),
                  ]
                )
            ),
          ),
        ));
  }
}
