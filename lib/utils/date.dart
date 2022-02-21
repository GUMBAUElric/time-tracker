import 'package:intl/intl.dart';

String getCurrentFullDate() {
  return DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
}

String getCurrentDate() {
  return DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
}

String getCurrentTime() {
  return DateFormat('HH:mm').format(DateTime.now()).toString();
}
