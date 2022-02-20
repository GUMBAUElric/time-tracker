import 'package:intl/intl.dart';

class UserModel {
  String pseudo;
  String connectedAt = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());

  UserModel({required this.pseudo});
}
