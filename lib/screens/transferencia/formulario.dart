import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/components/editor.dart';
import 'package:flutter_app/models/transferencia.dart';

const _tituloAppBar = 'Criando Transferência';
const _numeroConta = 'Número da conta';
const _confirmar = 'Confirmar';
const _valor = 'Valor';

class FormularioTranferencia extends StatefulWidget {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return FormularioTranferenciaState();
  }
}

class FormularioTranferenciaState extends State<FormularioTranferencia>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controler:  widget._controladorCampoNumeroConta,
              rotulo: _numeroConta,
              dica: '0000',
            ),
            Editor(
                controler:  widget._controladorCampoValor,
                rotulo: _valor,
                dica: '0,00',
                icone: Icons.monetization_on),
            RaisedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_confirmar),
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse( widget._controladorCampoNumeroConta.text);
    final double valor = double.tryParse( widget._controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      Navigator.pop(context,  Tranferencia(valor, numeroConta));
    }
  }
}