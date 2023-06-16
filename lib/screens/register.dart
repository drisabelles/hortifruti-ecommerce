import 'package:flutter/material.dart';
//import 'package:flutter_app/components/custom_date_picker.dart';
//import 'package:intl/intl.dart';
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
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var phoneFormatter = new MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var zipCodeFormatter = new MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  //final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _houseNumberController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _addressComplementController =
      TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  DateTime? _dateOfBirth;

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
                    style:
                      TextStyle(
                        color: Colors.green,
                        fontSize: 18, 
                        fontWeight: FontWeight.w500
                      )
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    controller: _nameController,
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
                    controller: _surnameController,
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
                    controller: _cpfController,
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
                    controller: _emailController,
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
                    controller: _phoneController,
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
                    controller: _usernameController,
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
                    controller: _passwordController,
                    obscureText: obscuredText,
                    label: 'Senha',
                    hint: 'Crie uma senha forte',
                    icon: Icons.vpn_key,
                    suffix: IconButton(
                      onPressed: () {
                        setState(() {
                          obscuredText = !obscuredText;
                        });
                      },
                      icon: Icon(obscuredText
                          ? Icons.visibility
                          : Icons.visibility_off),
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
                  Text('Dados Residenciais',
                      style:
                          TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    controller: _addressController,
                    obscureText: false,
                    label: 'Logradouro',
                    hint: 'Ex.: Rua Fulano de Tal',
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
                    controller: _houseNumberController,
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
                    controller: _neighborhoodController,
                    obscureText: false,
                    label: 'Bairro',
                    hint: 'Ex.: Jardim do Céu',
                    icon: Icons.place,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                      }
                    },
                    onSaved: (text) => user = user.copyWith(neighborhood: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    controller: _addressComplementController,
                    obscureText: false,
                    label: 'Complemento',
                    hint: 'Ex.: Apto 150, bloco B',
                    icon: Icons.location_city,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Esse campo deve ser preenchido';
                      }
                    },
                    onSaved: (text) =>
                        user = user.copyWith(address_complement: text),
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    keyboardType: TextInputType.text,
                    controller: _stateController,
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
                    controller: _zipCodeController,
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Profile(
                                    name: user.name,
                                    surname: user.surname,
                                    cpf: user.cpf,
                                    email: user.email,
                                    phone: user.phone,
                                    username: user.username,
                                    password: user.password,
                                    address: user.address,
                                    neighborhood: user.neighborhood,
                                    number: user.number,
                                    address_complement: user.address_complement,
                                    uf: user.uf,
                                    zip_code: user.zip_code,
                                  )));
                        }
                      },
                      child: const Text('Cadastrar',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFfdfdfd)),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: const Text('Já tem uma conta? Faça login',
                          style: TextStyle(
                            color: Color(0xFFff8800),
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

  //Future<void> pickDateOfBirth(BuildContext context) async {
  //  final initialDate = DateTime.now();
  //  final newDate = await showDatePicker(
  //      context: context,
  //      initialDate: _dateOfBirth ?? initialDate,
  //      firstDate: DateTime(DateTime.now().year - 100),
  //      lastDate: DateTime(DateTime.now().year + 1),
  //      builder: (context, child) => Theme(
  //            data: ThemeData().copyWith(
  //                colorScheme: const ColorScheme.light(
  //                    primary: Color(0xFFff8800),
  //                    onPrimary: Colors.white,
  //                    onSurface: Colors.black),
  //                dialogBackgroundColor: Colors.white),
  //            child: child ?? const Text(''),
  //          ));
  //
  //  if (newDate == null) {
  //    return;
  //  }
//
  //  setState(() {
  //    _dateOfBirth = newDate;
  //    String dateOfBirth = DateFormat('dd/MM/yyyy').format(newDate);
  //    _dateOfBirthController.text = dateOfBirth;
  //  });
  //}
}
