class Transferencia {
  final int accountNumber;
  final double valueTransfer;

  Transferencia(this.accountNumber, this.valueTransfer);

  @override
  String toString() {
    return 'Transferencia{accountNumber: $accountNumber, valueTransfer: $valueTransfer}';
  }
}