import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/client_model.dart';
import 'package:http/http.dart' as http; 

class Clients extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  late Future<List<Client>> clients;

  @override
  void initState() {
    super.initState();
    clients = catchClients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Clientes'),
        ),
        body: Center(
          child: FutureBuilder<List<Client>>(
            future: clients,
            builder: (context, snapshot) {
              if (snapshot.hasData) { 
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                    Client client = snapshot.data![index];
                    return ListTile(
                      title: Text(client.name!),
                      subtitle: Text(client.email!),
                    );
                  }
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        )
      );
  }

  Future<List<Client>> catchClients() async {
    var url = Uri.parse('https://6472540d6a9370d5a41b432c.mockapi.io/clients');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List clientsList = json.decode(response.body);
      return clientsList.map((json) => Client.fromJson(json)).toList();
    } else {
      throw Exception('Erro: não foi possível carregar os usuários.');
    }
  }

}
