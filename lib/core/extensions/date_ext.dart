import 'package:intl/intl.dart';

extension DateX on DateTime {
  String get friendly => DateFormat.yMMMd().format(this);
}
