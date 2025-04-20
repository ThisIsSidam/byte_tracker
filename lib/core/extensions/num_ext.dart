import 'package:intl/intl.dart';

extension NumExt on num {
  String toCurrency() {
    final NumberFormat formatter = NumberFormat.decimalPattern();
    return formatter.format(this);
  }
}
