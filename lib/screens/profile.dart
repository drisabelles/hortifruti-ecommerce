import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

  String name, surname, cpf, email, phone, username, password, address, number, address_complement, uf, zip_code;

  Profile(
    {
      required this.name,
      required this.surname,
      required this.cpf,
      required this.email,
      required this.phone,
      required this.username,
      required this.password,
      required this.address,
      required this.number,
      required this.address_complement,
      required this.uf,
      required this.zip_code
    }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: Text('Olá ${name}!'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nome completo: ${name} ${surname}'),
              const SizedBox(height: 15,),
              Text('CPF: ${cpf}'),
              const SizedBox(height: 15,),
              Text('E-mail: ${email}'),
              const SizedBox(height: 15,),
              Text('Celular: ${phone}'),
              const SizedBox(height: 15,),
              Text('Nome de usuário: ${username}'),
              const SizedBox(height: 15,),
              Text('Senha: ${password}'),
              const SizedBox(height: 15,),
              Text('Endereço: ${address}'),
              const SizedBox(height: 15,),
              Text('Número: ${number}'),
              const SizedBox(height: 15,),
              Text('Complemento: ${address_complement}'),
              const SizedBox(height: 15,),
              Text('UF: ${uf}'),
              const SizedBox(height: 15,),
              Text('CEP: ${zip_code}'),
              const SizedBox(height: 15,),
            ],
          ),
        )
      );
  }
}
