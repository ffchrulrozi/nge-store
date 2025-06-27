import 'package:hive/hive.dart';

part 'account.g.dart';

@HiveType(typeId: 0)
class Account {
  @HiveField(0)
  String? email;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? photo;

  Account({this.email, this.name, this.photo});
}
