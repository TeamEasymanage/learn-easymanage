
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// [1] Uncomment to Add Your Table Data Fetch and Notify
/*
import 'package:em_app/em_global.dart'; 
import 'package:em_app/pages/fhorderdetails/fhorderdetails_model.dart'; 
import 'package:em_app/pages/fhorderdetails/fhorderdetails_service.dart'; 
*/

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();
  

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> init() async {

  if(isAndroid()) {

  final AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher'); //'@mipmap-mdpi/ic_launcher' | 'app_icon'
  
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
    //onDidReceiveLocalNotification: onDidReceiveLocalNotification,
  );
  
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid, 
            iOS: initializationSettingsIOS, 
            macOS: null);
  
   await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification
        );
  }
  }


   void selectNotification(String? payload) async {
      //Handle notification tapped logic here
   }

 Future<void> showNotification(int mId, String title, String body, String payload) async {
  if(isAndroid()) {
    //var random = Random();
    //var mId = random.nextInt(50000);
    //print("mId " +mId.toString());
     AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'EmId',//'your channel id', //mId.toString(), 
            'EmChannel' ,//'your channel name',
            channelDescription: 'Em Channel', //'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
     NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
        /*
        // to test static notification
    await flutterLocalNotificationsPlugin.show(
        1, //0 0=System, 1=User 2=Admin 3=SuAdmin
        'title', //'plain title', 
        'body', //'plain body', 
        platformChannelSpecifics,
        payload: 
        'payload', //'item x'
        );
        */
    await flutterLocalNotificationsPlugin.show(
        mId, //0 0=System, 1=User 2=Admin 3=SuAdmin
        title, //'plain title', 
        body, //'plain body', 
        platformChannelSpecifics,
        payload: 
        payload, //'item x'
        );
  }

  } //if(isAndroid()) 
}

bool isAndroid() {
if (kIsWeb) {
} else {
  if (Platform.isAndroid) {
    return true;
  }
}
  return false;
}

class MyNotificationSet {
  Future<void> CheckAndNotify() async {
  if(isAndroid()) {

  //Comment out when adding custom notification
  NotificationService().showNotification(1, 'User Msg','Welcome to Em App [1]', 'Please Customize') ;

// [2] Uncomment to Add Your Table Data Fetch and Notify
    //await FhOrderDetailsNotify().CheckAndNotify();
  }
  }
}

// [3] Uncomment to Add Your Table Data Fetch and Notify
/*

class FhOrderDetailsNotify {
  //final String? FindByColumnName;
 
  String errorMsg = timeErrStr; 
 
  List<FhOrderDetails> fhOrderDetailsList = []; 
 
  bool _loading = true; 


 // ---------- To Implement - GET value from Hive and FindByColumnName -------------------  
  String userCode = ""; 
  //bool _loadingProvider = true; 
 
  Future<void> CheckAndNotify() async {
    / *
    var usersBox = await Hive.openBox('users');
    var localUser = usersBox.get("userKey");

      userCode = localUser.emUserId;
      _loadingProvider = false; 

    print("localUser "+localUser.toString());
    * /
 
    _loading = true; 
    print("Calling Service : viewAllFhOrderDetails ... "); 
    //if (userCode.isNotEmpty) {
    FhOrderDetailsService.FhOrderDetailsViewAll(
      -1
    ).then((getList) {
      if (getList is String) {
          errorMsg = getList;
      } else {
        fhOrderDetailsList = getList; 
        int recCount = fhOrderDetailsList.length; 
        print("rec count: "+recCount.toString());
        if (recCount > 0) {
        String gotKeyNos = "";
        //fhOrderDetailsList.forEach((element) => gotKeyNos = gotKeyNos + element.toListLabVal()[0][1].toString()+ ", ",);
        gotKeyNos = recCount.toString();
        NotificationService().showNotification(1, 'User Msg: $userCode','Total Records ['+gotKeyNos.toString()+']', 'Please Check') ;
        }
        _loading = false;
      }
    });
    //}
  }
}
*/ 

