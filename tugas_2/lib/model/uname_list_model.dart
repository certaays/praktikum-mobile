import 'package:hive/hive.dart';

part 'uname_list_model.g.dart';

@HiveType(typeId: 1)
class UnameListModel{

  UnameListModel({required this.uname});

  @HiveField(0)
  String uname;

  @override
  String toString() {
    return 'UnameListModel{uname: $uname}';
  }
}