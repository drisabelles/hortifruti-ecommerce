import 'package:flutter/material.dart';
import 'package:flutter_app/models/product_model.dart';
import 'package:flutter_app/repositories/cart_repository.dart';
import 'package:flutter_app/repositories/products_repository.dart';
import 'package:flutter_app/screens/product_details.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  final table = ProductsRepository.table;
  NumberFormat real = NumberFormat.currency(locale: 'pt-BR', name: 'R\$');
  List<Product> choosed = [];
  late CartRepository itens;

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
      body: ListView.separated(
        itemBuilder: (BuildContext context, int product) {
          return ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            leading: (choosed.contains(table[product]))
                ? CircleAvatar(
                    child: Icon(Icons.check),
                  )
                : SizedBox(
                    child: Image.asset(table[product].icon),
                    width: 32,
                  ),
            title: Row(
              children: [
                Text(
                  table[product].nome,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500
                  )
                ),
                if (itens.lista.contains(table[product])) 
                  Icon(Icons.shopping_cart, color: Colors.deepOrange, size: 8)
              ],
            ),
            trailing: Text(
              real.format(
                table[product].preco,
              ),
              style: TextStyle(fontSize: 16)
            ),
            selected: choosed.contains(table[product]),
            selectedTileColor: Colors.indigo[50],
            onLongPress: () {
              setState(() {
                (choosed.contains(table[product]))
                    ? choosed.remove(table[product])
                    : choosed.add(table[product]);
                  });
                  },
            onTap: () => showDetails(table[product]),
          );
        },
        padding: EdgeInsets.all(15),
        separatorBuilder: (_, ___) => Divider(),
        itemCount: table.length
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
}
