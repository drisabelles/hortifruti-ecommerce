import 'package:flutter/material.dart';
import 'package:flutter_app/models/checkbox_model.dart';

class Survey extends StatefulWidget {
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  List<CheckboxModel> _dropdownAvailability = [];
  List<CheckboxModel> _dropdownAvailability2 = [];
   
  List<String> selectedItens1 = [];
  List<String> selectedItens2 = [];

  @override
  void initState() {
    _dropdownAvailability.addAll({
      CheckboxModel(id: 1, title: 'Preços bons', selected: false),
      CheckboxModel(id: 2, title: 'Entregas rápidas', selected: false),
      CheckboxModel(id: 3, title: 'Variedade de produtos', selected: false),
      CheckboxModel(id: 4, title: 'Qualidade dos produtos', selected: false),
      CheckboxModel(id: 5, title: 'Comodidade', selected: false),
    });
        _dropdownAvailability2.addAll({
      CheckboxModel(id: 1, title: 'Combos de produtos', selected: false),
      CheckboxModel(id: 2, title: 'Mais promoções', selected: false),
      CheckboxModel(id: 3, title: 'Aumentar o raio de entrega', selected: false),
      CheckboxModel(id: 4, title: 'Mais variedade de frutas e verduras', selected: false),
      CheckboxModel(id: 5, title: 'Adicionar itens de produto animal', selected: false),
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesquisa'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15),
            Text(
              'Quais os motivos que te levaram a comprar conosco?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              )),
            SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _dropdownAvailability.length,
              itemBuilder: (context, index) {
                return CheckboxListTile( 
                  controlAffinity: ListTileControlAffinity.leading,
                  title:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_dropdownAvailability[index].title),              
                    ],
                  ),
                  value: _dropdownAvailability[index].selected,
                  onChanged: (value) {
                    _dropdownAvailability[index].selected = value!;
                    setState(() {
                      if (value == true) {
                        selectedItens1.add(_dropdownAvailability[index].title);
                      } else {
                        selectedItens1.remove(_dropdownAvailability[index].title);
                      }
                    });
                  }
                );
              },
            ),
            Divider(),
            SizedBox(height: 15),
            Text(
              'Quais melhorias acha que poderíamos ter?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              )),
            SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _dropdownAvailability2.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_dropdownAvailability2[index].title),                  
                    ],
                  ),
                  value: _dropdownAvailability2[index].selected,
                  onChanged: (value) {
                    _dropdownAvailability2[index].selected = value!;
                    setState(() {
                      if (value == true) {
                        selectedItens2.add(_dropdownAvailability2[index].title);
                      } else {
                        selectedItens2.remove(_dropdownAvailability2[index].title);
                      }
                    });
                  },
                );
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                        elevation: 16,
                        child: Container(
                          child: ListView(
                            padding: EdgeInsets.all(16.0),
                            shrinkWrap: true,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  '<-- Resultado da pesquisa -->\n\nMotivos que levaram a compra: ${selectedItens1}\n\nMelhorias: ${selectedItens2}',
                                  style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.w500
                                  )
                                )
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: const Text(
                  'Enviar', 
                  style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w500
                  )
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/home');
                      },
                      child: const Text(
                        'Voltar para página inicial',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        )
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

