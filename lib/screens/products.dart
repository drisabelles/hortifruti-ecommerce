import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/product_model.dart';
import 'package:flutter_app/repositories/cart_repository.dart';
import 'package:flutter_app/screens/product_details.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  NumberFormat real = NumberFormat.currency(locale: 'pt-BR', name: 'R\$');
  List<Product> choosed = [];
  late CartRepository itens;

  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = catchProducts();
  }

  showDetails(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetails(product: product)
      ),
    );
  }

  cleanChoosed () {
    setState(() {
      choosed = [];
    });
  }

  @override
  Widget build(BuildContext context) {

    itens = context.watch<CartRepository>();

    return Scaffold(
      appBar: AppBar(
          title: const Text('Produtos'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/cart');
              },
            )
          ],
        ),
      body: FutureBuilder<List<Product>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasData) { 
                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Product product = snapshot.data![index];
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      leading: (choosed.contains(product))
                        ? CircleAvatar(
                          child: Icon(Icons.check),
                        )
                        : SizedBox(
                          child: Image.asset(product.icon!),
                          width: 32,
                        ),
                      title: Row(
                        children: [
                          Text(
                            product.name!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                            )
                          ),
                    
                          if (itens.lista.contains(product))
                            Icon(Icons.shopping_cart, color: Colors.deepOrange, size: 10)
                        ],
                      ),
                      trailing: Text(
                        real.format(
                          product.price!,
                        ),
                        style: TextStyle(fontSize: 16)
                      ),
                      selected: choosed.contains(product),
                      selectedTileColor: Colors.indigo[50],
                      onLongPress: () {
                        setState(() {
                          (choosed.contains(product))
                          ? choosed.remove(product)
                          : choosed.add(product);
                        });
                      },
                      onTap: () => showDetails(product),
                    );
                  },
                  padding: EdgeInsets.all(15),
                  separatorBuilder: (_, ___) => Divider(),
                );
              } 
              
              else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } 
              
              else {
                return const CircularProgressIndicator();
              }
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: choosed.isNotEmpty
            ? FloatingActionButton.extended(
                onPressed: () {
                  itens.saveAll(choosed);
                  cleanChoosed();
                },
                icon: Icon(Icons.shopping_cart),
                label: Text(
                  'Adicionar ao carrinho',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : null,
    );
  }

  Future<List<Product>> catchProducts() async {
    var url = Uri.parse('https://647215bf6a9370d5a41b0362.mockapi.io/products');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List productsList = json.decode(response.body);
      return productsList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Erro: não foi possível carregar os usuários.');
    }
  }
}
