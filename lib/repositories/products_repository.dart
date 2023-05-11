import 'package:flutter_app/models/product_model.dart';

class ProductsRepository {
  static List<Product> table = [
    Product(
      icon: 'assets/images/products/espinafre.png', 
      nome: 'Espinafre', 
      preco: 2.45
    ),
    Product(
      icon: 'assets/images/products/morango.png', 
      nome: 'Morango', 
      preco: 4.79
    ),
    Product(
      icon: 'assets/images/products/cenoura.png', 
      nome: 'Cenoura', 
      preco: 5.65
    ),
    Product(
      icon: 'assets/images/products/mirtilo.png', 
      nome: 'Mirtilo', 
      preco: 6.15
    ),
    Product(
      icon: 'assets/images/products/pimenta.png', 
      nome: 'Pimentão',
      preco: 10.95
    ),
    Product(
      icon: 'assets/images/products/melancia.png', 
      nome: 'Melancia', 
      preco: 7.89
    ),
    Product(
      icon: 'assets/images/products/batata.png', 
      nome: 'Batata Inglesa', 
      preco: 3.50
    ),
    Product(
      icon: 'assets/images/products/alho.png', 
      nome: 'Alho', 
      preco: 1.95
    ),
    Product(
      icon: 'assets/images/products/abobora.png', 
      nome: 'Abóbora Moranga', 
      preco: 12.15
    ),
    Product(
      icon: 'assets/images/products/kiwi.png', 
      nome: 'Kiwi', 
      preco: 8.65
    ),
    Product(
      icon: 'assets/images/products/abacate.png', 
      nome: 'Abacate', 
      preco: 9.15
    )
  ];
}