import 'package:bytebank/models/Transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'FormularioTransferencia.dart';

class ListaTransferencias extends StatefulWidget{
  final List<Transferencia> _transferencias = List.empty(growable: true);

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget._transferencias.length.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTranferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), onPressed: () {
        final Future<Transferencia?> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FormularioTransferencia();
        }));
        future.then((transferenciaRecebida) {
          setState(() {
            widget._transferencias.add(transferenciaRecebida!);
          });
        });
      },),
    );
  }
}

class ItemTranferencia extends StatelessWidget
{
  final Transferencia _transferencia;

  ItemTranferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transferencia.valueTransfer.toString()),
        subtitle: Text(this._transferencia.accountNumber.toString()),
      ),
    );
  }
}