import 'package:flutter/material.dart'; 
import 'package:intl/intl.dart';  
 
import 'package:em_app/em_global.dart'; 
import 'package:em_app/pages/erpinventoryvw/erpinventoryvw_model.dart'; 
import 'package:em_app/pages/erpinventoryvw/erpinventoryvw_service.dart'; 
import 'package:em_app/pages/erpinventoryvw/erpinventoryvw_lib.dart'; 
import 'package:em_app/pages/erpinventoryvw/erpinventoryvw_data_table.dart'; 
 
 // [1] Uncomment For Media Upload Customization 
 /* 
import 'dart:convert'; 
import 'dart:io'; 
import 'dart:typed_data'; 
 
import 'package:file_picker/file_picker.dart'; 
import 'package:flutter/foundation.dart'; 
import 'package:em_app/em_media_upload_lib.dart';  
 */ 
 
class ErpInventoryVwForm extends StatefulWidget { 
  const ErpInventoryVwForm({Key? key}) : super(key: key); 
 
  @override 
  _ErpInventoryVwFormState createState() => _ErpInventoryVwFormState(); 
} 
 
class _ErpInventoryVwFormState extends State<ErpInventoryVwForm> { 
 
  double emFormHeight  = emFormFixedHeight;  
  double emFormWidth  = emFormFixedWidth;  
 
  static final formKey = GlobalKey<FormState>(); 
		String invIdVar = ""; 
		String? productIdVar = ""; 
		String? productNameVar = ""; 
		String? invDateVar = ""; 
		String? invQtyVar = ""; 
		String? invMinQtyVar = ""; 
		String? invCostVar = ""; 
		String? invLocationVar = ""; 
 
 // [2] Uncomment For Media Upload Customization 
 /* 
		bool isField01IsImage = true; File? valFile01; PlatformFile? valPlatFile01; String? valFile01Base64; 
 */ 
 
 
	DateTime selectedDate4 = DateTime.now();		
	TextEditingController _textEditingController4 = TextEditingController();	
		
	_selectDate4(BuildContext context) async {		
		final DateTime? selected4 = await showDatePicker(		
		  context: context,		
		  initialDate: selectedDate4,		
		  firstDate: DateTime(1900),		
		  lastDate: DateTime(2100),		
		);		
		
		if (selected4 != null && selected4 != selectedDate4)	{	
		  setState(() {		
			selectedDate4 = selected4;		
			_textEditingController4.text = DateFormat(emDateFmt).format(selectedDate4);		
		  });		
	  	}		
	  }		
 	
 
 
 
@override 
void didChangeDependencies() { 
    // MediaQuery.of(context) 
      emFormWidth =  getEmFormWidth(context); 
      emFormHeight = getEmFormHeight(context); 
      //print("Width | Height " + emFormWidth.toString() + " | " + emFormHeight.toString()); 
    super.didChangeDependencies(); 
} 
 
 
  @override 
  Widget build(BuildContext context) { 
	return Scaffold( 
        backgroundColor: Colors.blue.shade200, 
        appBar: AppBar( 
          title: const Text("ErpInventoryVw Add Form"), 
          centerTitle: true, 
        ), 
        body: Center( 
          child: Padding( 
                  padding: const EdgeInsets.only(top: 32.0), 
          child: Container( 
            padding: const EdgeInsets.only(top: 16.0), 
            decoration: const BoxDecoration(boxShadow: [ 
              BoxShadow( 
                color: Colors.white, 
              ), 
            ], borderRadius: BorderRadius.all(Radius.circular(10.0))), 
			 width: emFormWidth, //getEmFormWidth(context), 
            height: emFormHeight, //MediaQuery.of(context).size.height, 
            //width: formWidth , 
            // height: 590, 
            //width: MediaQuery.of(context).size.width, 
            child: SingleChildScrollView(
              child: Form( 
              key: formKey, 
              //autovalidateMode: AutovalidateMode.onUserInteraction, 
 
              child: Padding( 
                padding: const EdgeInsets.all(16.0), 
                child: SingleChildScrollView( 
                child: Column(  
                children: [ 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [1] [ Name [Invid] : EM Type [NUMBER], Java Type [long]  
				  //                  EM size: maxlength: 10, Display Size : 10 
				  // Flutter Details: Field Label [Inv Id], Name [invId], Type [int]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL   enabled: false,    initialValue: getEmStrOpt(foundRecord.invId.toString()),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(10), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Inv Id', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 10, Display Size : 10 
					//for display width , adjust parent available space  
					validator: (value) { 
					  if (value!.isEmpty) {  
						return  'Field can not be empty'; }  
					  if (!_isNumeric(value)) { 
						return ' | Enter a valid Numeric value'; } 
					  return null;  
					}, 
					//maxLength: 30, 
					onSaved: (value) => setState(() => invIdVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [2] [ Name [Productid] : EM Type [NUMBER], Java Type [long]  
				  //                  EM size: maxlength: 10, Display Size : 10 
				  // Flutter Details: Field Label [Product Id], Name [productId], Type [int]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.productId.toString()),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(10), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Product Id', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 10, Display Size : 10 
					//for display width , adjust parent available space  
					validator: (value) { 
					  if (value!.isEmpty) {  
						//not mandatory - no numeric chk  
					  } else {  
					  	if (!_isNumeric(value)) { 
							return 'Enter a valid Numeric value'; } 
					  }  
					  return null;  
					}, 
					//maxLength: 30, 
					onSaved: (value) => setState(() => productIdVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [3] [ Name [Productname] : EM Type [CHAR], Java Type [String]  
				  //                  EM size: maxlength: 50, Display Size : 20 
				  // Flutter Details: Field Label [Product Name], Name [productName], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.productName),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(20), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Product Name', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 50, Display Size : 20 
					//for display width , adjust parent available space  
					/*  
					validator: (value) { 
					  if (value!.isEmpty) {  
						return  'Field can not be empty'; }  
					  if (!_isNumeric(value)) { 
						return ' | Enter a valid Numeric value'; } 
					  return null;  
					}, 
					*/  
					//maxLength: 30, 
					onSaved: (value) => setState(() => productNameVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [4] [ Name [Invdate] : EM Type [DATE], Java Type [Calendar]  
				  //                  EM size: maxlength: 10, Display Size : 10 
				  // Flutter Details: Field Label [Inv Date], Name [invDate], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
				controller: _textEditingController4,  
					//EDT-INIT-VAL    //IS-PICKER  initialValue: getEmStrOpt(foundRecord.invDate),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(10), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Inv Date', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 10, Display Size : 10 
					//for display width , adjust parent available space  
					/*  
					validator: (value) { 
					  if (value!.isEmpty) {  
						return  'Field can not be empty'; }  
					  if (!_isNumeric(value)) { 
						return ' | Enter a valid Numeric value'; } 
					  return null;  
					}, 
					*/  
					//maxLength: 30, 
					onSaved: (value) => setState(() => invDateVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				    //Date Picker For [invDate], [Invdate] 
				    IconButton(	
				        onPressed: () {	
				          _selectDate4(context);	
				        },	
				        icon: Icon(Icons.calendar_today, color: Colors.grey,)	
					 ),	
				    Align(	
				      child: SizedBox(	
				        width: 200,	
				        //height: 50,	
				        child: 	
				       Text("${selectedDate4.day}/${selectedDate4.month}/${selectedDate4.year}"),	
				      ),	
				    ),	
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [5] [ Name [Invqty] : EM Type [NUMBER], Java Type [long]  
				  //                  EM size: maxlength: 10, Display Size : 10 
				  // Flutter Details: Field Label [Inv Qty], Name [invQty], Type [int]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.invQty.toString()),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(10), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Inv Qty', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 10, Display Size : 10 
					//for display width , adjust parent available space  
					validator: (value) { 
					  if (value!.isEmpty) {  
						//not mandatory - no numeric chk  
					  } else {  
					  	if (!_isNumeric(value)) { 
							return 'Enter a valid Numeric value'; } 
					  }  
					  return null;  
					}, 
					//maxLength: 30, 
					onSaved: (value) => setState(() => invQtyVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [6] [ Name [Invminqty] : EM Type [NUMBER], Java Type [long]  
				  //                  EM size: maxlength: 10, Display Size : 10 
				  // Flutter Details: Field Label [Inv Min Qty], Name [invMinQty], Type [int]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.invMinQty.toString()),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(10), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Inv Min Qty', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 10, Display Size : 10 
					//for display width , adjust parent available space  
					validator: (value) { 
					  if (value!.isEmpty) {  
						//not mandatory - no numeric chk  
					  } else {  
					  	if (!_isNumeric(value)) { 
							return 'Enter a valid Numeric value'; } 
					  }  
					  return null;  
					}, 
					//maxLength: 30, 
					onSaved: (value) => setState(() => invMinQtyVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [7] [ Name [Invcost] : EM Type [FLOAT], Java Type [float]  
				  //                  EM size: maxlength: 15, Display Size : 15 
				  // Flutter Details: Field Label [Inv Cost], Name [invCost], Type [double]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.invCost.toString()),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(15), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Inv Cost', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 15, Display Size : 15 
					//for display width , adjust parent available space  
					validator: (value) { 
					  if (value!.isEmpty) {  
						//not mandatory - no numeric chk  
					  } else {  
					  	if (!_isNumeric(value)) { 
							return 'Enter a valid Numeric value'; } 
					  }  
					  return null;  
					}, 
					//maxLength: 30, 
					onSaved: (value) => setState(() => invCostVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [8] [ Name [Invlocation] : EM Type [CHAR], Java Type [String]  
				  //                  EM size: maxlength: 50, Display Size : 20 
				  // Flutter Details: Field Label [Inv Location], Name [invLocation], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.invLocation),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(20), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Inv Location', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 50, Display Size : 20 
					//for display width , adjust parent available space  
					/*  
					validator: (value) { 
					  if (value!.isEmpty) {  
						return  'Field can not be empty'; }  
					  if (!_isNumeric(value)) { 
						return ' | Enter a valid Numeric value'; } 
					  return null;  
					}, 
					*/  
					//maxLength: 30, 
					onSaved: (value) => setState(() => invLocationVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
 
 // [3] Uncomment For Media Upload Customization 
 // Move / Place *Below Block* BEF Begin of Row( For Field 
 /* 
          //Processing Logic for enabling Fields For - File | Image | Video picker Upload in Base64 format 
          isField01IsImage ?  
              kIsWeb ? showPopUpGetFileWeb01(context) : showPopUpGetFile01(context) 
          : 
				//Row(  
 */ 
 
                  const SizedBox(height: 20,), 
                  Builder( 
                    builder: (context) => ButtonWidget( 
                      text: 'Submit', 
 
                      onClicked: () async 
                      	 { 
                        final isValid = formKey.currentState!.validate(); 
                        // FocusScope.of(context).unfocus(); 
 
                        if (isValid) { 
                          formKey.currentState!.save(); 
 
                          String apiMessage = ""; 
 
						// ========================================================================================================= 
						// ===== BEGIN BLOCK : Calling API Service Calls ('Create') 1st (optional 2nd...) and Routing to Next Screen 
 
 // [4] Uncomment For Media Upload Customization. Also Uncomment Media Field Assignment in  newErpInventoryVw creation below  
 /* 
                          //Get Base64 ready 
                          await convertToBytesFile(context); 
 */ 
 
 /* 
                          //Uncomment and Use Model ErpInventoryVwWoKey from model.dart, when key should not be passed, it is @GeneratedValue on API side  
                          ErpInventoryVwWoKey newErpInventoryVw = ErpInventoryVwWoKey( 
                          //Also Remove Key's TextFormField [1] in Form() method, and Comment Out - Key: Value Assignment below   
 */ 
 
                          // ===== Begin Table-1: Model Assign And Create Service Call 
 
                          ErpInventoryVw newErpInventoryVw = ErpInventoryVw( 
					   invId: getEmIntStr(invIdVar) , 
					   productId: getEmIntStrOpt(productIdVar) , 
					   productName: productNameVar , 
					   invDate: invDateVar , 
					   invQty: getEmIntStrOpt(invQtyVar) , 
					   invMinQty: getEmIntStrOpt(invMinQtyVar) , 
					   invCost: getEmDoubleStrOpt(invCostVar) , 
					   invLocation: invLocationVar , 
							  ); 
 
                          await ErpInventoryVwService.ErpInventoryVwCreate( 
                                  newErpInventoryVw.toJson()) 
                              .then((message) { 
                                    apiMessage = message; 
                                    message == "Record Added Successfully" 
                                        ? null	
                                        : showDialog(	
                                            context: context,	
                                            builder: (ctx) => AlertDialog(	
                                              title: const Text("Error Status"),	
                                              content: Text(message),	
                                              actions: <Widget>[	
                                                ElevatedButton(	
                                                  onPressed: () {	
                                                    Navigator.of(ctx).pop();	
                                                  },	
                                                  child: const Text("OK"),	
                                                ),	
                                              ],	
                                            ),	
                                          );	
	
                            final snackBar = SnackBar( 
                              //duration: const Duration(seconds: 10), //default is 4 sec 
                              padding: const EdgeInsets.symmetric( 
                                  horizontal: 50, vertical: 8), 
                              content: Text( 
                                message, 
                                //style: Theme.of(context).textTheme.headline5, 
                              ), 
                              backgroundColor: 
                                  message == "Record Added Successfully" 
                                      ? Colors.green 
                                      : Colors.redAccent, 
                            ); 
                            ScaffoldMessenger.of(context) 
                                .showSnackBar(snackBar); 
	 
                          }); 
                          // ===== End Table-1: Model Assign And Create Service Call 
 
                          // ===== Begin Table-2: Model Assign And Create Service Call 
                          			// If Saving Data to 2 tables is required, Copy/Place those calls here 
 
                          // ===== End Table-2: Model Assign And Create Service Call 
 
 
                          // ===== Begin: Routing To ListView To Display Data 
                          // ===== Clear Routes As Back buttons leading to previous screens showing old data state are avoided 
                          /* */
                            apiMessage == "Record Added Successfully" 
                            ?  
                            Navigator.pushAndRemoveUntil(  
                              context,  
                              MaterialPageRoute(   
                                      builder: (context) =>  const ErpInventoryVwDataTable(viewType: "ListView"),   
                                      				//If Premium: Use parameter to show presently added/edited record 
                                      				//searchClause: " key = 'value' ",  
                                    ),  
                              (Route<dynamic> route) => route.isFirst  
                              ) 
                              : null;  
                          /* */ 
                          // ===== End: Routing To ListView To Display Data 
 
                          // ===== Begin: More Routing Options 
 
								/* To implement RETURN to previous screens 1 or 2 Levels BACK, Or Do routing only when API call success condition  -------  
								int popCount = 0;  
                                  apiMessage == "Record Added Successfully" 
								? 	 
									//Exit 2 levels as data table view not refreshed  
									Navigator.of(context).popUntil((_) => popCount++ >= 2)  
									//Navigator.of(context).pop()   
								: null;  
								*/  
 
                          // ===== End: More Routing Options 
 	
 
						// ===== END BLOCK : Calling API Service Calls ('Create') 1st (optional 2nd...) and Routing to Next Screen 
						// ========================================================================================================= 
 
                        } //if form valid
                      }, //onClicked 
                    ), //ButtonWidget 
                  ) //Builder 
                ], 
              ), 
             ), 
            ), 
           ), 
          ), 
         ), 
        ), 
       ), 
     ); 
	} 
 
 // [5] Uncomment For Media Upload Customization 
 //     And assign to correct blob field in your table , i.e. replace 'productPictureVar' 
 /* 
Widget showPopUpGetFile01(BuildContext context) { 
      return    Column( 
            //mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: <Widget>[ 
          ElevatedButton( 
          onPressed: () { 
                Navigator.of(context).push(MaterialPageRoute( 
                  builder: (context) =>  
                //EmUploadFile(callback: (File ) {  },) 
                EmUploadFile(callback: (val) => setState(() => valFile01 = val)) 
                 )); 
                 //print("Received Media File: "+valFile01!.path.toString()); 
 
          }, 
          child: const Text("Select From Storage or Capture via Camera"), 
          ), 
          const SizedBox(height: 10), 
          if (valFile01 != null ) Text(("Selected File: "+valFile01!.path.toString())), 
          ElevatedButton( 
          onPressed: () { 
                setState(() { 
                  valFile01 = null; 
                }); 
          }, 
          child: const Text("Clear Selection"), 
          ), 
          ], 
          ); 
 
} 
Widget showPopUpGetFileWeb01(BuildContext context) { 
      return    Column( 
            //mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: <Widget>[ 
          ElevatedButton( 
          onPressed: () { 
                Navigator.of(context).push(MaterialPageRoute( 
                  builder: (context) =>  
                //EmUploadFile(callback: (File ) {  },) 
                EmUploadFileWeb(callback: (val) => setState(() => valPlatFile01 = val)) 
                 )); 
                 //print("Received Media File: "+valPlatFile01!.path.toString()); 
 
          }, 
          child: const Text("Select From Storage"), 
          ), 
          const SizedBox(height: 10), 
          if (valPlatFile01 != null ) Text(("Selected File: "+valPlatFile01!.name)), 
          ElevatedButton( 
          onPressed: () { 
                setState(() { 
                  valPlatFile01 = null; 
                }); 
          }, 
          child: const Text("Clear Selection"), 
          ), 
          ], 
          ); 
 
} 
 
 
Future<void> convertToBytesFile(BuildContext context) async { 
 
              if (isField01IsImage) {  
                if(kIsWeb) { 
                    await convertToBytesFileWeb01(context); 
                    productPictureVar = valFile01Base64; 
 
                } else { 
                    await convertToBytesFile01(context); 
                    productPictureVar = valFile01Base64; 
                } 
              } 
} 
 
Future<void> convertToBytesFile01(BuildContext context) async { 
    if (valFile01 != null) { 
      print("Reading File:" + valFile01!.path); 
      Uint8List imgbytes = await valFile01!.readAsBytes(); 
      print("File Size:" + imgbytes.length.toString()); 
      String base64ImgBytes = base64.encode(imgbytes); 
      setState(() { 
        valFile01Base64 = base64ImgBytes; 
      }); 
    } 
     var snackBar = const SnackBar( 
       content: Text("Processing File Upload ..."), 
     ); 
     ScaffoldMessenger.of(context).showSnackBar(snackBar); 
}  
 
Future<void> convertToBytesFileWeb01(BuildContext context) async { 
    if (valPlatFile01 != null) { 
      Uint8List? imgbytes = valPlatFile01!.bytes; 
      // print("File Size:" + imgbytes.length.toString()); 
      String base64ImgBytes = base64.encode(imgbytes!); 
      setState(() { 
        valFile01Base64 = base64ImgBytes; 
      }); 
    } 
     var snackBar = const SnackBar( 
       content: Text("Processing File Upload ..."), 
     ); 
     ScaffoldMessenger.of(context).showSnackBar(snackBar); 
  } 
 
 */ 
 
} 
 
 
bool _isNumeric(String s) { 
  // ignore: unnecessary_null_comparison 
  if (s == null) { 
    return false; 
  } 
  return double.tryParse(s) != null; 
} 
 
class ButtonWidget extends StatelessWidget { 
  final String text; 
  final VoidCallback onClicked; 
 
  const ButtonWidget({ 
    required this.text, 
    required this.onClicked, 
    Key? key, 
  }) : super(key: key); 
 
  @override 
  Widget build(BuildContext context) => ElevatedButton( 
        child: Text( 
          text, 
          style: const TextStyle(fontSize: 24, color: Colors.white), 
        ), 
        style: ButtonStyle( 
            backgroundColor: MaterialStateProperty.all<Color>( 
                Theme.of(context).primaryColor), 
            minimumSize: MaterialStateProperty.all(const Size(300, 40)),  
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>( 
                const EdgeInsets.symmetric(horizontal: 2.0, vertical: 16.0))), 
        onPressed: onClicked, 
      ); 
} 
 
 
