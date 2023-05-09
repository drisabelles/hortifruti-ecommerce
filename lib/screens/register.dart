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
                    prefix_icon: Icons.person,
                    suffix_icon: null,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(nome: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Nome de usuário',
                    prefix_icon: Icons.person_outlined,
                    suffix_icon: null,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(nome_usuario: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Senha',
                    prefix_icon: Icons.vpn_key,
                    suffix_icon: null,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(nome_usuario: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'E-mail',
                    prefix_icon: Icons.mail,
                    suffix_icon: null,
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
                    prefix_icon: Icons.place,
                    suffix_icon: null,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(endereco: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Número',
                    prefix_icon: Icons.numbers,
                    suffix_icon: null,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(numero: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Complemento',
                    prefix_icon: Icons.location_city,
                    suffix_icon: null,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(complemento: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'UF',
                    prefix_icon: Icons.map,
                    suffix_icon: null,
                    validator: (text) => text == null || text.isEmpty
                        ? 'Esse campo deve ser preenchido'
                        : null,
                    onSaved: (text) => user = user.copyWith(uf: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'CEP',
                    prefix_icon: Icons.numbers,
                    suffix_icon: null,
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
                              builder:(context) => Profile(nome: user.nome, email: user.email, endereco: user.endereco, numero: user.numero, complemento: user.complemento, uf: user.uf, cep: user.cep)));
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
  final String email;
  final String endereco;
  final String numero;
  final String complemento;
  final String uf;
  final String cep;

  UserModel({
    this.nome = '',
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
    String? email,
    String? endereco,
    String? numero,
    String? complemento,
    String? uf,
    String? cep,
  }) {
    return UserModel(
      nome: nome ?? this.nome,
      email: email ?? this.email,
      endereco: endereco ?? this.endereco,
      numero: numero ?? this.numero,
      complemento: complemento ?? this.complemento,
      uf: uf ?? this.uf,
      cep: cep ?? this.cep,
    );
  }
}
