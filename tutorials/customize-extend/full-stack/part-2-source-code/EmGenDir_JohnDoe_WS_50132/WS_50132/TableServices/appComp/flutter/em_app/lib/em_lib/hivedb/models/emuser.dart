import 'package:hive/hive.dart';

part 'emuser.g.dart';

@HiveType(typeId: 1)
class EmUser {
  @HiveField(0)
  String emUserName = "";

  @HiveField(1)
  String emMobile = "";
  
  @HiveField(2)
  String emEmail = "";

  @HiveField(3)
  String emUserId = "";

  @HiveField(4)
  String emPassword = "";

  @HiveField(5)
  bool emAuthenticated = false;
}
