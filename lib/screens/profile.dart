import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

  String name, surname, cpf, email, phone, username, password, address, neighborhood, number, address_complement, uf, zip_code;

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
      required this.neighborhood,
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
          title: Text('Olá ${username}!'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                  children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(100))
                        ),
                        child: SizedBox(
                          child: Image.asset('assets/images/profile/joaninha.png'),
                          width: 130,
                          height: 130,

                        )
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      child: Text(
                        '${name} ${surname}',
                        style: 
                          TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          )
                      ),
                    ), 
                    SizedBox(height: 3),
                    Center(
                      child: Text(
                        '${email}',
                        style: TextStyle(
                          fontSize: 15,
                        )
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>
                          [
                            TextSpan(text: 'CPF: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.deepOrange)),
                            TextSpan(text: '${cpf}', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>
                          [
                            TextSpan(text: 'Celular: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.deepOrange)),
                            TextSpan(text: '${phone}', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>
                          [
                            TextSpan(text: 'Logradouro: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.deepOrange)),
                            TextSpan(text: '${address}', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>
                          [
                            TextSpan(text: 'Número: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.deepOrange)),
                            TextSpan(text: '${number}', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>
                          [
                            TextSpan(text: 'Bairro: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.deepOrange)),
                            TextSpan(text: '${neighborhood}', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>
                          [
                            TextSpan(text: 'Complemento: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.deepOrange)),
                            TextSpan(text: '${address_complement}', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>
                          [
                            TextSpan(text: 'UF: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.deepOrange)),
                            TextSpan(text: '${uf}', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>
                          [
                            TextSpan(text: 'CEP: ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.deepOrange)),
                            TextSpan(text: '${zip_code}', style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: 45),
                    SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/home');
                      },
                      child: const Text(
                        'Ir para página inicial',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ),
                  ),
                  ]
                )
            )
          )
      );
  }
}
