// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:em_app/em_param.dart';
import 'package:em_app/main.dart';

// -------------------------------------------------------
// EM Global Variables and application properties
// -------------------------------------------------------
// ------ REST API params ---------------
String apiUrl = "127.0.0.1:9080";
String apiPathPrefix = "/emdbrest";

// ------ GraphQL API params ---------------
//Defined both separate as User might Use Grql for Query Only, and they can host REST/Grql separately
String apiUrlGrql = "127.0.0.1:9080";
String apiGrqlPathPrefix = "/graphql";

// ------ REST or GraphQL  ---------------
bool isApiUseGrql = true;

int apiPageSize = 10; //Use 8 for web

// ------ GraphQL Settings ---------------
bool isGrqlUseNoPkgForViewAllQry = false;

// ------ API common params ---------------
String apiScheme = "http";
//String apiScheme = "https";

// ------ To enable Secure REST API calling with Http Basic Auth ---------------
String apiUsername = 'emAdmin'; //'emUser'; //'user';
String apiPassword = 'emAdmin123'; //'emUser123';
bool isApiCallSecure = false;

// ------ To configure API calling settings ---------------
String timeErrStr = "Request is taking too much time!";
String connErrStr = "Check your Server Connection!";
int apiCallTimeoutSec = 10;

// -------------------------------------------------------
// EM Regional Formatting
// EM DATE and TIME Formatting are handled via individual widgets and API calls
// EM Number and Currency Formatting For EM Types NUMBER | MONEY handled via flags and functions in this file
// (Note: EM Types DATETIME|FLOAT|DOUBLE are not formatted)
// To disable any NUMBER | MONEY formatting set flag to false below
// -------------------------------------------------------

String emDateFmt = emParamDateFmt; 
String emTimeFmt = emParamTimeFmt; 

String emLocale = emParamLocale;
bool isEmNumFmt = true;
bool isEmCurFmt = true;

// ------ Some flutter widget used global fixed settings ---------------
double emFormFixedHeight  = 700; 	
double emFormFixedWidth  = 350; //370; //390 	

double emImageFixedHeight  = 400; 	
double emImageFixedWidth  = 300; 	

// ------ Optimization Settings ---------------
// ------ Pagination - Wheather to clear routes to First ? flag ---------------
bool emNextPrevPageClearRoutes  = true; 	

// -------------------------------------------------------
// EM Library Functions
// Handling of empty or null values for non-key columns
// -------------------------------------------------------

String getEmStrOpt(String? dataStr) {
  String ret1 = "";
  if (dataStr != null) {
    ret1 = dataStr;
  }
  return ret1;
}

int? getEmIntStrOpt(String? dataStr) {
  int? ret1;
  if (dataStr != null) {
    //print("val 0 - $dataStr ");
    try {
      ret1 = int.parse(getEmStrOpt(dataStr));
    } catch (e) {
      print(e);
    }
    //print("val 1 - $ret1 ");
  }
  return ret1;
}

int getEmIntStr(String? dataStr) {
  int ret1 = 0;
  if (dataStr != null) {
    try {
      ret1 = int.parse(getEmStrOpt(dataStr));
    } catch (e) {
      print(e);
    }
  }
  return ret1;
}

double? getEmDoubleStrOpt(String? dataStr) {
  double? ret1;
  if (dataStr != null) {
    try {
      ret1 = double.parse(getEmStrOpt(dataStr));
    } catch (e) {
      print(e);
    }
  }
  return ret1;
}

double getEmDoubleStr(String? dataStr) {
  double ret1 = 0;
  if (dataStr != null) {
    try {
      ret1 = double.parse(getEmStrOpt(dataStr));
    } catch (e) {
      print(e);
    }
  }
  return ret1;
}

bool? getEmBoolStrOpt(String? dataStr) {
  bool? ret1;
  //dataStr as bool;
  if (dataStr != null) {
    if (dataStr == "true") {
      ret1 = true;
    }
    if (dataStr == "t") {
      ret1 = true;
    }
    if (dataStr == "1") {
      ret1 = true;
    }
    if (dataStr == "false") {
      ret1 = false;
    }
    if (dataStr == "f") {
      ret1 = false;
    }
    if (dataStr == "0") {
      ret1 = false;
    }
  }
  return ret1;
}

bool getEmBoolStr(String? dataStr) {
  bool ret1 = false;
  if (dataStr != null) {
    if (dataStr == "true") {
      ret1 = true;
    }
    if (dataStr == "t") {
      ret1 = true;
    }
    if (dataStr == "1") {
      ret1 = true;
    }
    if (dataStr == "false") {
      ret1 = false;
    }
    if (dataStr == "f") {
      ret1 = false;
    }
    if (dataStr == "0") {
      ret1 = false;
    }
  }
  return ret1;
}

// -------------------------------------------------------

String getEmFmtNumOpt(dynamic numVal) {
  String ret1 = "";

  switch (isEmNumFmt) {
    case true:
      {
        if (numVal != null) {
          ret1 =
              NumberFormat.decimalPattern(emLocale).format(numVal).toString();
        }
      }
      break;
    case false:
      {
        ret1 = numVal.toString();
      }
      break;
  }
  return ret1;
}

String getEmFmtCurOpt(dynamic numVal) {
  String ret1 = "";

  switch (isEmCurFmt) {
    case true:
      {
        if (numVal != null) {
          ret1 =
              NumberFormat.currency(locale: emLocale).format(numVal).toString();
        }
      }
      break;
    case false:
      {
        ret1 = numVal.toString();
      }
      break;
  }
  return ret1;
}

// -------------------------------------------------------

Uri getEmUri(
String authority,
String unencodedPath,
[Map<String, dynamic>? queryParameters]
) {
    return 
    apiScheme == "https"
    ? Uri.https(authority, unencodedPath, queryParameters)
    : Uri.http(authority, unencodedPath, queryParameters);
}  
  

Map<String, String> getEmApiHeaders() {
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$apiUsername:$apiPassword'));
  // print(basicAuth);

  Map<String, String> headers1 = {'EmMode01': ''};

  if (isApiCallSecure) {
    headers1 = {'Authorization': basicAuth};
  }
  //print(headers1);
  return headers1;
  //return <String, String>{"Authorization": basicAuth};
}

Map<String, String> getEmApiHeadersCU() {
  //String basicAuth =
  //'Basic ' + base64Encode(utf8.encode('$apiUsername:$apiPassword'));
  //'Content-Type': 'application/json'
  Map<String, String> headers2 = {'Content-Type': 'application/json'};
  if (isApiCallSecure) {
    headers2.addAll(getEmApiHeaders());
  }
  //print(headers2);
  return headers2;
}

// -------------------------------------------------------

emLaunchWebURL(String urlText) async {

  String procUrl = urlText;
  String ucUrl = urlText.toUpperCase();
  //String varScheme = "http";

  if (ucUrl.contains("HTTPS://")) {
    //varScheme = "https";
    //procUrl = urlText.substring(9);
    //ok
  } else if (ucUrl.contains("HTTP://")) {
    //varScheme = "https";
    //procUrl = urlText.substring(8);
    //ok
  } else {
    procUrl = "http://"+ urlText;
  }

  //print("calling "+urlText);
  //print("processed "+procUrl);
  if (await canLaunchUrl(Uri.parse(procUrl))) {
    await launchUrl(Uri.parse(procUrl), mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch [$urlText] [$procUrl]';
  }
}

/*
emLaunchWebURL(String authority, String unencodedPath) async {
  if (await canLaunchUrl(Uri.https(authority, unencodedPath))) {
    await launchUrl(Uri.https(authority, unencodedPath), mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $authority + $unencodedPath';
  }
}
*/

dispHyperlinkFromText(String urltxt){
  return 
       Text.rich(
        TextSpan(
                  text: urltxt,
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () { 
                      emLaunchWebURL(urltxt);
                  },
                )
        );
}
// -------------------------------------------------------

//Show a proper error message to the user

class EmShowProgress extends StatefulWidget {
  final String msg;
  const EmShowProgress({Key? key, required this.msg}) : super(key: key);

  @override
  _EmShowProgressState createState() => _EmShowProgressState();
}

class _EmShowProgressState extends State<EmShowProgress> {
  int secondsTimeOut = apiCallTimeoutSec;
  Timer? timer;
  bool _showAlert = false;

  @override
  void initState() {
    super.initState();
    timer = Timer(Duration(seconds: secondsTimeOut), () {
      setState(() {
        _showAlert = true;
      });
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _showAlert
        ? AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
                widget.msg +
                    " (Timeout is set to : " +
                    secondsTimeOut.toString() +
                    " sec)",
                style: TextStyle(
                  color: Colors.red.shade500,
                  //fontSize: 20,
                  //fontWeight: FontWeight.w600
                )),
            actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyApp())),
                  child: const Text('OK'),
                ),
              ])
        : const Center(child: CircularProgressIndicator());
  }
}

// -------------------------------------------------------

// GraphQL Init Get Client

class EmGraphQLClient {
  GraphQLClient getClient() {
    final _httpLink = HttpLink(
       apiScheme + '://' + apiUrlGrql + apiGrqlPathPrefix,
        defaultHeaders: {'Content-Type': 'application/json'});

    Link _link = _httpLink;

    //print("Step-1");

    //If REQ Auth token
    /*
    final _authLink = AuthLink(
        getToken: () async => 'Bearer XYZ',
    );
    Link _link = _authLink.concat(_httpLink);
    */

    final GraphQLClient client = GraphQLClient(
      // **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(
          //store: InMemoryStore()
          //store: HiveStore()
          ),
      link: _link,
      alwaysRebroadcast: true,
    );

    //print("Step-2");
    return client;
  }
}

String transformJsonForMutate(String? queryParam1) {
  //print(queryParam1);
    String queryParam = "";
    if (queryParam1 != null) {
      queryParam = queryParam1;
    } else {
      return queryParam;
    }
    queryParam = "\n " + queryParam.replaceAll(",",",\n");
    List<String> listOrg = queryParam.split("\n");
    String listNew = "";
    for (var e in listOrg) {
        //print("=========");
        //print(e);

        int idx = e.indexOf(":");

        //List<String> lineParts = e.split(":");
        if(idx > 1) {
          List<String> lineParts = [e.substring(0,idx), e.substring(idx+1)];
          //remove quotes around key names
          lineParts[0] = lineParts[0].replaceAll("\"", "");
          //escape newline from value
          //print("1-O ="+lineParts[1]);
          lineParts[1] = lineParts[1].replaceAll('\\n', '\\\\n');
          //print("1-M ="+lineParts[1]);
        listNew = listNew + " \n " + lineParts[0] + ":" + lineParts[1];
        } else {
        listNew = listNew + " \n " + e;
        }
        //print("=========");
        //print(listNew);
   }
  //print(listNew);
    return listNew;
}
