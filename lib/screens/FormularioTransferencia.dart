import 'package:bytebank/components/SimpleNumericInput.dart';
import 'package:bytebank/models/Transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _numeroContaController = TextEditingController();
  final TextEditingController _valorTransferenciaController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SimpleNumericInput(
              inputController: _numeroContaController,
              label: 'Número da conta',
              hint: '0000'),
          SimpleNumericInput(
              inputController: _valorTransferenciaController,
              label: 'Valor',
              hint: '0.00',
              icon: Icons.monetization_on),
          ElevatedButton(
            onPressed: () {
              _createTransferencia(context);
            },
            child: Text('Confirmar'),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          'Formulário de Transferencia',
        ),
      ),
    );
  }

  void _createTransferencia(BuildContext context) {
    final int accountNumber = int.tryParse(_numeroContaController.text) ?? 0;
    final double valueTransfer =
        double.tryParse(_valorTransferenciaController.text) ?? 0;

    if (accountNumber != 0 && valueTransfer != 0) {
      final transferencia = Transferencia(accountNumber, valueTransfer);
      Navigator.pop(context, transferencia);
    }
  }
}
