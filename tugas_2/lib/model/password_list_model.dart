import 'package:hive/hive.dart';

part 'password_list_model.g.dart';

@HiveType(typeId: 1)
class PasswordListModel{

  PasswordListModel({required this.password});

  @HiveField(0)
  String password;

  @override
  String toString() {
    return 'UnameListModel{password: $password}';
  }
}