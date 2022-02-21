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

bool timeRangeIsValid(String startTime, String endTime) {
  // Hours
  double startHour = double.parse(startTime.split(":")[0]);
  double endHour = double.parse(endTime.split(":")[0]);

  //Minutes
  double startMinutes = double.parse(startTime.split(":")[1]);
  double endMinutes = double.parse(endTime.split(":")[1]);

  if (endHour > startHour) return true;

  if (endHour == startHour && endMinutes > startMinutes) return true;

  return false;
}
