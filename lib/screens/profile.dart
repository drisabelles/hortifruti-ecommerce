import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String nome, nome_usuario, email, endereco, numero, complemento, uf, cep;

  Profile(
    { 
      required this.nome,
      required this.nome_usuario,
      required this.email,
      required this.endereco,
      required this.numero,
      required this.complemento,
      required this.uf,
      required this.cep
    }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Olá ${nome}!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.pink)),
              const SizedBox(height: 30,),
              Text('E-mail: ${email}'),
              const SizedBox(height: 15,),
              Text('Nome de usuário: ${nome_usuario}'),
              const SizedBox(height: 15,),
              Text('Endereço: ${endereco}'),
              const SizedBox(height: 15,),
              Text('Número: ${numero}'),
              const SizedBox(height: 15,),
              Text('Complemento: ${complemento}'),
              const SizedBox(height: 15,),
              Text('UF: ${uf}'),
              const SizedBox(height: 15,),
              Text('CEP: ${cep}'),
              const SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/home');                        
                  },
                  child: const Text(
                    'Ir para página inicial', 
                    style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w500
                    )
                  ),
                ),
              ),
            ],
          ),
          
        );
  }
}
