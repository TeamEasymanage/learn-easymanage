import 'dart:convert'; 
import 'dart:typed_data'; 
import 'package:flutter/material.dart'; 
 
import 'package:em_app/em_global.dart'; 
import 'package:em_app/pages/erpinventoryvw/erpinventoryvw_model.dart'; 
 
 // [1] Uncomment For Media Customization 
 /* 
import 'package:flutter/foundation.dart'; 
import 'package:em_app/em_media_lib.dart'; 
 */ 
 
 
	SingleChildScrollView ErpInventoryVw_dispForm(BuildContext context, ErpInventoryVw foundErpInventoryVw) { 	
	  return SingleChildScrollView( 	
		child: Container( 	
		  width: MediaQuery.of(context).size.width,	
	      child: Padding( 	
	        padding: const EdgeInsets.all(8.0), 	
        child: Flex(	
          direction: Axis.vertical,	
          children: [	
            Table(	
	            defaultVerticalAlignment: TableCellVerticalAlignment.middle, 	
	            //defaultColumnWidth: const FixedColumnWidth(180.0), 	
	            border: TableBorder.all( 	
	              width: 0.5, 	
	              color: Colors.blueGrey, 	
	            ), 	
	            children: foundErpInventoryVw 	
	                .toListLabValHide01() 	
	                .map((e) => TableRow(children: [ 	
	                      Column( 	
	                        crossAxisAlignment: CrossAxisAlignment.end, 	
	                        children: [ 	
	                          Padding( 	
	                            padding: const EdgeInsets.all(8.0), 	
	                            child: SelectableText(e.toList()[0], 	
	                                style: const TextStyle( 	
	                                  //fontSize: 18, 	
	                                  fontWeight: FontWeight.w600, 	
	                                  //color: Colors.black, 	
	                                )), 	
	                          ) 	
	                        ], 	
	                      ), 	
	                      Column( 	
	                        crossAxisAlignment: CrossAxisAlignment.start, 	
	                        children: [ 	
	                          Padding( 	
	                            padding: const EdgeInsets.all(8.0), 	
                                child: getFieldTextOrMedia(context, e.toList()[0], e.toList()[1]),	
	
                                /*	
	                            child: Text(e.toList()[1], 	
	                                style: const TextStyle( 	
	                                    //fontSize: 18, 	
	                                    //fontWeight: FontWeight.w500, 	
	                                    //color: Colors.black 	
	                                    )), 	
                                */	
	                          ) 	
	                        ], 	
	                      ), 	
	                    ])) 	
	                .toList()), 	
          ],	
        ),	
	      ), 	
		), 	
	  ); 	
	} 	
 
Widget getFieldTextOrMedia(BuildContext context, String fldName, String? fldVal) { 
  //print("Process:"+fldName); 
  switch (fldName) { 
 
 // [2] Uncomment For Media Customization 
 //     And replace "Product Picture" with correct field label for your field  
	/*  ==Uncomment this block to enable Media Viewer (Image | Video) For Field == 
    case "Product Picture":   //Replace this With Field Label Of Type Media (File)  
      { 
        bool isFieldIsImage = true; 
        bool isFieldIsVideo = false; 
        if (isFieldIsImage == true) { 
          bool isFieldIsImageBase64 = true; 
          print("File As Image :" + fldName); 
          //print("File:"+getEmStrOpt(fldVal)); 
          print("File fldVal Size:" + fldVal!.length.toString()); 
 
          if (isFieldIsImageBase64 == true) { 
          return getImageFromBase64(fldVal); 
          } else { 
            //For Web Chrome use flutter run --web-renderer html 
            //fldVal = 'https://www.easymanage.com/ems/emlogo.jpg'; 
            return getImageFromUrl(fldVal); 
          } 
        } else if (isFieldIsVideo == true) { 
          bool isFieldIsVideoBase64 = true; 
          print("File As Video :" + fldName); 
          //print("File:"+getEmStrOpt(fldVal)); 
          print("File fldVal Size:" + fldVal!.length.toString()); 
 
          //fldVal = "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"; 
 
          if ((kIsWeb == true) && (isFieldIsVideoBase64 == true))   { 
                  return const Text("(Video Player From Base64 Not supported on Web)"); 
          } else { 
 
          if (fldVal.length <= 0 || fldVal == "null")   { 
                  return const Text(""); 
          } else { 
 
          return ElevatedButton( 
              onPressed: () { 
                Navigator.of(context).push(MaterialPageRoute( 
                  builder: (context) =>  
                  (isFieldIsVideoBase64 == true) ? 
                  VideoPlayerScreen(fromSource: "Base64", sourceUrlPathBase64: fldVal) 
                  : 
                  VideoPlayerScreen(fromSource: "Network", sourceUrlPathBase64: fldVal) 
                )); 
              }, 
              child: const Icon(Icons.play_arrow)); 
          }  
          } //not web+base64 
 
         //return  const Text(""); //Todo EmDispMediaFromApiData(dataStr: fldVal); 
        } else { 
          return const Text(""); 
        } 
      } 
	   ==Uncomment this block to enable Media Viewer For Field == */ 
 
    default: 
      { 
        SelectableText(getEmStrOpt(fldVal), 
            style: const TextStyle( 
                //fontSize: 18, 
                //fontWeight: FontWeight.w500, 
                //color: Colors.black 
                )); 
      } 
  } 
  return SelectableText(getEmStrOpt(fldVal)); 
} 
 
Widget getImageFromBase64(String? fldVal) { 
  if (fldVal == null) { 
    return const Text(""); 
  } 
  if (fldVal == "null") { 
    return const Text(""); 
  } 
  if (fldVal.isEmpty) { 
    return const Text(""); 
  } 
      Uint8List memBytes = base64Decode(fldVal); 
      return Image.memory( 
        memBytes, 
        //height: emImageFixedHeight, //400, 
        width: emImageFixedWidth, //300, 
      ); 
  //return const Text(""); 
} 
 
Widget getImageFromUrl(String? fldVal) { 
  if (fldVal == null) { 
    return const Text(""); 
  } 
  if (fldVal == "null") { 
    return const Text(""); 
  } 
  if (fldVal.isEmpty) { 
    return const Text(""); 
  } 
      return Image.network( 
        fldVal, 
        //height: emImageFixedHeight, //400, 
        width: emImageFixedWidth, //300, 
      ); 
  //return const Text(""); 
} 
 
double getEmFormWidth(BuildContext context) { 
  double deviceWidth = MediaQuery.of(context).size.width; 
  if (deviceWidth <= 600) { 
    deviceWidth = deviceWidth * 0.95; 
  } else if (deviceWidth <= 700) { 
    deviceWidth = deviceWidth * 0.90; 
  } else { 
    deviceWidth = deviceWidth * 0.80; 
  } 
  return deviceWidth; 
} 
 
double getEmFormHeight(BuildContext context) { 
  double deviceHeight = MediaQuery.of(context).size.height; 
  deviceHeight = deviceHeight - 150;  
  return deviceHeight; 
} 
 
