import 'package:em_app/main.dart';
import 'package:em_app/em_lib/hivedb/models/emuser.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

  //We don't need to check if the user exists or not, since pages before this already do that.
  Future<void> SignOutEmUser(BuildContext context) async {
    var usersBox = await Hive.openBox('users');
    var _user = usersBox.get('userKey'); // Get current user from Hive.

    if(_user != null ) {
    _user.emAuthenticated = false; // logging the user out.
    _user.emUserId = 'Guest';
    _user.emUserName = 'Guest';
    //Updating the currentUser inside Hive.
    await usersBox.put('userKey', _user);
    }

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute( 
                                      builder: (context) =>  const MyHomePage(),
                                    ),
                              (Route<dynamic> route) => false
                              );
  }
