import 'package:intl/intl.dart';

String getCurrentFullDate() {
  return DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
}

String getCurrentDate() {
  return DateFormat('dd/MM/yyyy').format(DateTime.now()).toString();
}

int getCurrentDay() {
  return DateTime.now().day;
}

String getCurrentTime() {
  return DateFormat('HH:mm').format(DateTime.now()).toString();
}

String getDashBoardDate() {
  DateFormat _formatter = DateFormat('MMM');
  String _day = getCurrentDate().split("/")[0];

  // create a formatter to get months 3 character
  String _month = _formatter.format(DateTime.now());

  return "$_month $_day";
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

List<Map> getMonthDays() {
  List<int> _daysIndex = [];
  List<Map> monthDays = [];

  int _currentYear = DateTime.now().year;
  int _currentMonth = DateTime.now().month;
  int _currentDay = DateTime.now().day;

  int _nbOfDays = DateTime(_currentYear, _currentMonth + 1, 0).day;
  int _remainingDays = _nbOfDays - _currentDay;

  for (int i = -1; i > -_currentDay; i--) {
    _daysIndex.add(i);
  }

  _daysIndex = _daysIndex.reversed.toList();

  for (int i = 0; i <= _remainingDays; i++) {
    _daysIndex.add(i);
  }

  for (int i = 0; i < _daysIndex.length; i++) {
    String _dayName = DateFormat('EEE').format(
        DateTime(_currentYear, _currentMonth, _currentDay + _daysIndex[i]));

    monthDays.add({"dayNumber": "${i + 1}", "dayName": _dayName});
  }

  return monthDays;
}
