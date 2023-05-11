import 'package:flutter/material.dart';
import 'package:flutter_app/repositories/cart_repository.dart';
import 'package:flutter_app/screens/cart.dart';
import 'package:flutter_app/screens/login.dart';
import 'package:flutter_app/screens/products.dart';
import 'package:flutter_app/screens/purchase_confirmation.dart';
import 'package:flutter_app/screens/register.dart';
import 'package:flutter_app/screens/survey.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartRepository(),
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HortiFruti E-commerce',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Survey(),
      routes: {
        '/products': (context) => Products(),
        '/cart': (context) => Cart(),
        '/purchase_confirmation': (context) => PurchaseConfirmation(),
        '/home': (context) => Login(),
        '/register': (context) => Register()
      }
    );
  }
}
