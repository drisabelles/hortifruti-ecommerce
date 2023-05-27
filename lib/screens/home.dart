import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_text_field.dart';
import 'package:flutter_app/screens/profile.dart';
import 'package:string_validator/string_validator.dart' as validator;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final formKey = GlobalKey<FormState>();
  bool obscuredText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/market_logo.png', 
                  height: 200,
                  width: 200
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/products'); 
                    },
                    child: const Text(
                      'Comprar produtos', 
                      style: TextStyle(
                        fontSize: 15, 
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/survey'); 
                    },
                    child: const Text(
                      'Responder pesquisa', 
                      style: TextStyle(
                        fontSize: 15, 
                        fontWeight: FontWeight.w500
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/clients'); 
                    },
                    child: const Text(
                      'Visualizar clientes', 
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
      );
  }
}
