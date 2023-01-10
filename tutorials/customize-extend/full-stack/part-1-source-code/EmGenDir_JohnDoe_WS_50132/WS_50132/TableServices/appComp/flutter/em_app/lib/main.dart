import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:em_app/em_lib/main_lib.dart';
import 'package:em_app/em_notifications.dart';
import 'package:em_app/em_nav.dart';
import 'package:em_app/em_lib/hivedb/models/emuser.dart';

void main() async {

  await Hive.initFlutter('emappdb');
  Hive.registerAdapter(EmUserAdapter());

  //Notifications initialization
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,      
      title: 'EM App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the color for Drawer changes; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  EmUser emUser = EmUser();
  String curUser = 'Guest';

  //Notification vars
  int checkNotifyDur = 600; //seconds (10 min)
  Timer? checkNotifyTimer;
  bool checkNotifySet = false; //initialize to "true" to disable notifications

  bool _loading = true;
  @override
  void initState() {
    super.initState();
    getUser();
    setNotifications();
  }

  @override
  void dispose() {
    checkNotifyTimer!.cancel();
    super.dispose();
  }

  //---------- Get User
  Future<void> getUser() async {
    //await checkIfUserExists(); //This method creates a new user if it already does NOT exist.
    var box = await Hive.openBox("users");
    var user1 = await box.get('userKey');
    //print("User: "+user1.emUserId);
    setState(() {
      if(user1 != null) {
        emUser = user1;
        curUser = emUser.emUserId;
      }
      _loading = false;
    });
  }

  //------------------- New Orders Notifications
  setUpTimedFetch() async {
    print("Notify - Check Count Now ...");
      await MyNotificationSet().CheckAndNotify();
    print("Notify - Setting Timer Check Count every $checkNotifyDur sec ...");
    checkNotifyTimer = Timer.periodic(Duration(seconds: checkNotifyDur), (timer) async {
      await MyNotificationSet().CheckAndNotify();
    });
  }

  Future<void> setNotifications() async {
          if(checkNotifySet == false) {
            setUpTimedFetch();
            setState(() {
              checkNotifySet = true;
            });
          }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title),
      title: const Text('EM App'),
      ),
      body:
        _loading ? const CircularProgressIndicator() :
        SingleChildScrollView(
          child: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 24,
              ),
              PageMenuBlock(emUserId: curUser),
              const Text(
                'Please select option',
              ),
              /*
              Text(
                'Please select option from Menu',
                style: Theme.of(context).textTheme.headline6,
              ),
             */
            ],
          ),
      ),
        ),
      drawer: const NavBar(),
      endDrawer: const NavBarEnd(),
      //Below is visual UI Only, Need to Implement 
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: _selectBottomNavAction,
        items: _itemsBottomNavigationBar,
      ),
    );
  }

// -------- BottomNavigationBar ---------------- 
final List<BottomNavigationBarItem> _itemsBottomNavigationBar =
          const <BottomNavigationBarItem>[  
          BottomNavigationBarItem(icon: Icon(Icons.menu_outlined), label: "Menu"),
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: "Account"),
          BottomNavigationBarItem(icon: Icon(Icons.table_chart_outlined), label: "Tables"),
        ];

void _selectBottomNavAction(int index) {

    if (index == 0) {
      _scaffoldKey.currentState?.openDrawer();
    }
    if (index == 1) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute( 
                                      builder: (context) =>  const MyHomePage(),
                                    ),
                              (Route<dynamic> route) => false
                              );
    }
    if (index == 3) {
      _scaffoldKey.currentState?.openEndDrawer();
    }
}  
// -------- BottomNavigationBar ---------------- 

}

