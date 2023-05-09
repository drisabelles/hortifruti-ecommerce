import 'package:flutter/material.dart';
import 'package:flutter_app/screens/profile.dart';

class PurchaseConfirmation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PurchaseConfirmationState();
}

class _PurchaseConfirmationState extends State<PurchaseConfirmation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Confirmação de Compra'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              Image.asset(
                'assets/images/market_logo.png', 
                height: 200,
                width: 200
              ),
              const SizedBox(height: 30),
              Text('Seu pedido foi confirmado.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              const SizedBox(height: 15),
              Text('Obrigada por comprar conosco!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/products');
                      },
                      child: const Text(
                        'Voltar para a tela de produtos', 
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15)
                      ),
                    ),
                  ),
                ])),
          ),
        );
  }
}