import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_text_field.dart';
import 'package:flutter_app/screens/profile.dart';
import 'package:string_validator/string_validator.dart' as validator;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../models/user_model.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var user = UserModel();
  final formKey = GlobalKey<FormState>();

  bool obscuredText = true;

  var cpfFormatter = new MaskTextInputFormatter(
    mask: '###.###.###-##', 
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );

  var phoneFormatter = new MaskTextInputFormatter(
    mask: '(##) #####-####', 
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );

  var zipCodeFormatter = new MaskTextInputFormatter(
    mask: '#####-###', 
    filter: { "#": RegExp(r'[0-9]') },
    type: MaskAutoCompletionType.lazy
  );

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
                  Text(
                    'Dados Pessoais',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    )
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    label: 'Nome',
                    hint: 'Digite seu primeiro nome',
                    icon: Icons.person,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                      }

                      if (!validator.isAlpha(text)) {
                        return 'Esse campo só pode conter letras';
                      }
                    },
                    onSaved: (text) => user = user.copyWith(name: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    label: 'Sobrenome',
                    hint: 'Digite o seu sobrenome',
                    icon: Icons.person,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                      }

                      if (!validator.isAlpha(text)) {
                        return 'Esse campo só pode conter letras';
                      }
                    },
                    onSaved: (text) => user = user.copyWith(surname: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    inputFormatters: [cpfFormatter],
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    label: 'CPF',
                    hint: 'Ex.: 999-999-999.99',
                    icon: Icons.credit_card,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                      }
                    },
                    onSaved: (text) => user = user.copyWith(cpf: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    label: 'Email',
                    hint: 'Ex.: exemplo@email.com',
                    icon: Icons.mail,
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
                    inputFormatters: [phoneFormatter],
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    label: 'Celular',
                    hint: 'Ex.: (99) 99999-9999',
                    icon: Icons.phone,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                      }
                    },
                    onSaved: (text) => user = user.copyWith(phone: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    label: 'Nome de usuário',
                    hint: 'Crie nome de usuário',
                    icon: Icons.person_outline,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                      }
                    },
                    onSaved: (text) => user = user.copyWith(username: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    obscureText: obscuredText,
                    label: 'Senha',
                    hint: 'Crie uma senha forte',
                    icon: Icons.vpn_key,
                    suffix: IconButton(
                      onPressed: (){
                        setState(() {
                          obscuredText = !obscuredText;
                        });
                      }, 
                      icon: Icon(
                        obscuredText ? Icons.visibility : Icons.visibility_off
                      ),
                    ),
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                      }

                      if (text.length < 8) {
                        return 'A sua senha precisa ter ao menos 8 caracteres';
                      } 
                    },
                    onSaved: (text) => user = user.copyWith(password: text),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Dados Residenciais',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500
                    )
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    label: 'Endereço',
                    hint: 'Ex.: Rua Fulano de Tal, Bairro Ciclano',
                    icon: Icons.place,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                      }
                    },
                    onSaved: (text) => user = user.copyWith(address: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    label: 'Número',
                    hint: 'Ex.: 99',
                    icon: Icons.numbers,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                      }

                      if (!validator.isNumeric(text)) {
                        return 'Esse campo só pode conter números';
                      }
                    },
                    onSaved: (text) => user = user.copyWith(number: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    label: 'Complemento',
                    hint: 'Ex.: Apto 150, bloco B',
                    icon: Icons.location_city,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                      }
                    },
                    onSaved: (text) => user = user.copyWith(address_complement: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    label: 'UF',
                    hint: 'Ex.: SP',
                    icon: Icons.map,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                      }

                      if (text.length < 2 || text.length > 2) {
                        return 'A sigla do estado deve conter 2 letras';
                      }

                      if (!validator.isAlpha(text)) {
                        return 'A sigla é composta somente de letras';
                      }
                    },
                    onSaved: (text) => user = user.copyWith(uf: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [zipCodeFormatter],
                    obscureText: false,
                    label: 'CEP',
                    hint: 'Ex.: 99999-999',
                    icon: Icons.numbers,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                      }
                    },
                    onSaved: (text) => user = user.copyWith(zip_code: text),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:(context) => Profile(
                                name: user.name, 
                                surname: user.surname, 
                                cpf: user.cpf, 
                                email: user.email,
                                phone: user.phone,
                                username: user.username,
                                password: user.password,
                                address: user.address, 
                                number: user.number, 
                                address_complement: user.address_complement, 
                                uf: user.uf, 
                                zip_code: user.zip_code,
                              )
                            )
                          );
                        }
                      },
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        )
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
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: const Text(
                        'Já tem uma conta? Faça login',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ),
                  ),
                ])),
          ),
        ));
  }
}