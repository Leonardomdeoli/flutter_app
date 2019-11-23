import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/models/transferencia.dart';

import 'formulario.dart';

class ListaTranferencias extends StatefulWidget {
  final List<Tranferencia> _tranferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTranferenciasState();
  }
}

class ListaTranferenciasState extends State<ListaTranferencias>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferência'),
      ),
      body: ListView.builder(
          itemCount: widget._tranferencias.length,
          itemBuilder: (context, indice) => ItemTransferencia(widget._tranferencias[indice])
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Tranferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context) => FormularioTranferencia()));
          future.then((tranferenciaRecebida) {
            if(tranferenciaRecebida != null){
              setState(() {//chamar o build outra vez para atualizar a lista
                widget._tranferencias.add(tranferenciaRecebida);
              });
            }
          });
        },
      ),
    );
  }
}