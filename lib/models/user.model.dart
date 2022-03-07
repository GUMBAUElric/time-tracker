import 'package:time_tracker/utils/date.dart';

class UserModel {
  String pseudo;
  String connectedAt = getCurrentFullDate();

  UserModel({required this.pseudo});
}
