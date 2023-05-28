import 'package:flutter_app/models/product_model.dart';
import 'package:flutter_app/repositories/cart_repository.dart';
import 'package:flutter_app/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
        actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.attach_money,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/purchase_confirmation');
              },
            )
          ],
      ),
      body: Container(
        color: Colors.indigo.withOpacity(0.05),
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(12.0),
        child: Consumer<CartRepository>(
          builder: (context, itens, child) {
            return itens.lista.isEmpty
                ? Center(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: ListTile(
                        leading: Image.asset(
                          'assets/images/colheita.png',
                        ),
                        title: Text('Ainda não há itens no carrinho.')
                      ),
                    ) 
                  ) 
                : ListView.builder(
                    itemCount: itens.lista.length,
                    itemBuilder: (_, index) {
                      return ProductCard(product: itens.lista[index]);
                    },
                  );
          },
        ), 
      ),
    );
  }
}