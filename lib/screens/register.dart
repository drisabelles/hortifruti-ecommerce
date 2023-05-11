import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_text_field.dart';
import 'package:flutter_app/screens/profile.dart';
import 'package:string_validator/string_validator.dart' as validator;

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var user = UserModel();
  final formKey = GlobalKey<FormState>();
  bool obscuredText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  CustomTextField(
                    label: 'Nome',
                    obscureText: false,
                    icon: Icons.person,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(nome: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Nome de usuário',
                    obscureText: false,
                    icon: Icons.person_outlined,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(nome_usuario: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Senha',
                    obscureText: !obscuredText,
                    icon: Icons.vpn_key,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                       return 'Esse campo deve ser preenchido';
                      }
                      if (text.length < 8) {
                        return 'A senha deve conter pelo menos 8 caracteres';
                      }
                    },
                    onSaved: (text) => user = user.copyWith(senha: text),
                    suffix: IconButton(
                      onPressed: (){
                        setState(() {
                          obscuredText = !obscuredText;
                        });
                      }, 
                      icon: Icon(
                        obscuredText ? Icons.visibility_off : Icons.visibility
                      ),
                    )
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'E-mail',
                    obscureText: false,
                    icon: Icons.mail,
                    suffix: null,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                      }

                      if (!validator.isEmail(text)) {
                        return 'Formato inválido para e-mail';
                      }
                    },
                    onSaved: (text) => user = user.copyWith(email: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Endereço', 
                    obscureText: false,
                    icon: Icons.place,
                    suffix: null,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(endereco: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Número',
                    obscureText: false,
                    icon: Icons.numbers,
                    suffix: null,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(numero: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Complemento',
                    obscureText: false,
                    icon: Icons.location_city,
                    suffix: null,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(complemento: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'UF',
                    obscureText: false,
                    icon: Icons.map,
                    suffix: null,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(uf: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'CEP',
                    obscureText: false,
                    icon: Icons.numbers,
                    suffix: null,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(cep: text),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:(context) => Profile(nome: user.nome, nome_usuario: user.nome_usuario, email: user.email, endereco: user.endereco, numero: user.numero, complemento: user.complemento, uf: user.uf, cep: user.cep)));
                        }
                      },
                      child: const Text(
                        'Cadastrar', 
                        style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500
                        )
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/home');
                      },
                      child: Text(
                        'Já tem uma conta? Faça login', 
                        style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w500
                        )
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        side: BorderSide(
                          color: Colors.deepOrange,
                          width: 2
                        )
                      ),
                    )
                  ),
                ])),
          ),
        ));
  }
}

@immutable
class UserModel {
  final String nome;
  final String nome_usuario;
  final String senha;
  final String email;
  final String endereco;
  final String numero;
  final String complemento;
  final String uf;
  final String cep;

  UserModel({
    this.nome = '',
    this.nome_usuario = '',
    this.senha = '',
    this.email = '',
    this.endereco = '',
    this.numero = '',
    this.complemento = '',
    this.uf = '',
    this.cep = '',
  });

  UserModel copyWith({
    String? nome,
    String? nome_usuario,
    String? senha,
    String? email,
    String? endereco,
    String? numero,
    String? complemento,
    String? uf,
    String? cep,
  }) {
    return UserModel(
      nome: nome ?? this.nome,
      nome_usuario: nome_usuario ?? this.nome_usuario,
      senha: senha ?? this.senha,
      email: email ?? this.email,
      endereco: endereco ?? this.endereco,
      numero: numero ?? this.numero,
      complemento: complemento ?? this.complemento,
      uf: uf ?? this.uf,
      cep: cep ?? this.cep,
    );
  }
}
