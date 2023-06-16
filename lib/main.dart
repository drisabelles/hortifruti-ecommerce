import 'package:flutter/material.dart';
import 'package:flutter_app/repositories/cart_repository.dart';
import 'package:flutter_app/screens/cart.dart';
import 'package:flutter_app/screens/clients.dart';
import 'package:flutter_app/screens/login.dart';
import 'package:flutter_app/screens/products.dart';
import 'package:flutter_app/screens/purchase_confirmation.dart';
import 'package:flutter_app/screens/register.dart';
import 'package:flutter_app/screens/survey.dart';
import 'package:flutter_app/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartRepository(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HortiFruti E-commerce',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFfdfdfd), 
        primarySwatch: Colors.green),
      home: Login(),
      routes: {
        '/cart': (context) => Cart(),
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/products': (context) => Products(),
        '/purchase_confirmation': (context) => PurchaseConfirmation(),
        '/register': (context) => Register(),
        '/survey': (context) => Survey(),
        '/clients': (context) => Clients(),
      }
    );
  }
}
