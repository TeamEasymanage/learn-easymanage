import 'package:flutter/material.dart'; 
import 'package:intl/intl.dart';  
 
import 'package:em_app/em_global.dart'; 
import 'package:em_app/pages/erpcustomer/erpcustomer_model.dart'; 
import 'package:em_app/pages/erpcustomer/erpcustomer_service.dart'; 
import 'package:em_app/pages/erpcustomer/erpcustomer_lib.dart'; 
import 'package:em_app/pages/erpcustomer/erpcustomer_data_table.dart'; 
 
 // [1] Uncomment For Media Upload Customization 
 /* 
import 'dart:convert'; 
import 'dart:io'; 
import 'dart:typed_data'; 
 
import 'package:file_picker/file_picker.dart'; 
import 'package:flutter/foundation.dart'; 
import 'package:em_app/em_media_upload_lib.dart';  
 */ 
 
class ErpCustomerForm extends StatefulWidget { 
  const ErpCustomerForm({Key? key}) : super(key: key); 
 
  @override 
  _ErpCustomerFormState createState() => _ErpCustomerFormState(); 
} 
 
class _ErpCustomerFormState extends State<ErpCustomerForm> { 
 
  double emFormHeight  = emFormFixedHeight;  
  double emFormWidth  = emFormFixedWidth;  
 
  static final formKey = GlobalKey<FormState>(); 
		String customerIdVar = ""; 
		String? nameVar = ""; 
		String? phoneVar = ""; 
		String? mobilePhoneVar = ""; 
		String? pictVar = ""; 
		String? emailVar = ""; 
		String? websiteVar = ""; 
		String? addressVar = ""; 
		String? dateofinquiryVar = ""; 
		String? requestedqtyVar = ""; 
		String? reqquoteamtVar = ""; 
		String? meetingpreftimeVar = ""; 
		String? createdVar = ""; 
		String? updatedVar = ""; 
 
 // [2] Uncomment For Media Upload Customization 
 /* 
		bool isField01IsImage = true; File? valFile01; PlatformFile? valPlatFile01; String? valFile01Base64; 
 */ 
 
 
	DateTime selectedDate9 = DateTime.now();		
	TextEditingController _textEditingController9 = TextEditingController();	
		
	_selectDate9(BuildContext context) async {		
		final DateTime? selected9 = await showDatePicker(		
		  context: context,		
		  initialDate: selectedDate9,		
		  firstDate: DateTime(1900),		
		  lastDate: DateTime(2100),		
		);		
		
		if (selected9 != null && selected9 != selectedDate9)	{	
		  setState(() {		
			selectedDate9 = selected9;		
			_textEditingController9.text = DateFormat(emDateFmt).format(selectedDate9);		
		  });		
	  	}		
	  }		
 	
	DateTime selectedTime12 = DateTime.now();		
	TextEditingController _textEditingController12 = TextEditingController();	
		
	  _selectTime12(BuildContext context) async {		
		  final TimeOfDay? timeOfDay12 = await showTimePicker(		
			context: context,		
			initialTime: TimeOfDay.fromDateTime(selectedTime12),		
			initialEntryMode: TimePickerEntryMode.dial,		
		  );		
 	
		  if(timeOfDay12 != null)		
			{		
			  setState(() {		
				//Flutter TimePicker only supports hour , minute (No seconds or milliseconds or timezone)	
				final now1 = DateTime.now();	
				selectedTime12 = DateTime(now1.year, now1.month, now1.day, timeOfDay12.hour, timeOfDay12.minute);	
				//selectedTime12.toString();	
				_textEditingController12.text = DateFormat(emTimeFmt).format(selectedTime12);		
				//print(_textEditingController12.text)	;	
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
          title: const Text("ErpCustomer Add Form"), 
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
				  // Column Details:  Srl No : [1] [ Name [CustomerId] : EM Type [CHAR], Java Type [String]  
				  //                  EM size: maxlength: 30, Display Size : 20 
				  // Flutter Details: Field Label [Customer Id], Name [customerId], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL   enabled: false,    initialValue: getEmStrOpt(foundRecord.customerId),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(20), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Customer Id', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 30, Display Size : 20 
					//for display width , adjust parent available space  
					validator: (value) { 
					  if (value!.isEmpty) {  
						return  'Field can not be empty'; }  
					  return null;  
					}, 
					//maxLength: 30, 
					onSaved: (value) => setState(() => customerIdVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [2] [ Name [Name] : EM Type [CHAR], Java Type [String]  
				  //                  EM size: maxlength: 300, Display Size : 20 
				  // Flutter Details: Field Label [Name], Name [name], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.name),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(20), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Name', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 300, Display Size : 20 
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
					onSaved: (value) => setState(() => nameVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [3] [ Name [Phone] : EM Type [CHAR], Java Type [String]  
				  //                  EM size: maxlength: 20, Display Size : 20 
				  // Flutter Details: Field Label [Phone], Name [phone], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.phone),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(20), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Phone', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 20, Display Size : 20 
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
					onSaved: (value) => setState(() => phoneVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [4] [ Name [MobilePhone] : EM Type [CHAR], Java Type [String]  
				  //                  EM size: maxlength: 20, Display Size : 20 
				  // Flutter Details: Field Label [Mobile Phone], Name [mobilePhone], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.mobilePhone),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(20), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Mobile Phone', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 20, Display Size : 20 
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
					onSaved: (value) => setState(() => mobilePhoneVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [5] [ Name [Pict] : EM Type [STREAM], Java Type [byte[]]  
				  //                  EM size: maxlength: 3, Display Size : 50 
				  // Flutter Details: Field Label [Pict], Name [pict], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL     //IS-FILE STREAM   initialValue: getEmStrOpt(foundRecord.pict),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(50), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Pict', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 3, Display Size : 50 
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
					onSaved: (value) => setState(() => pictVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [6] [ Name [Email] : EM Type [CHAR], Java Type [String]  
				  //                  EM size: maxlength: 500, Display Size : 20 
				  // Flutter Details: Field Label [Email], Name [email], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.email),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(20), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Email', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 500, Display Size : 20 
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
					onSaved: (value) => setState(() => emailVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [7] [ Name [WebSite] : EM Type [CHAR], Java Type [String]  
				  //                  EM size: maxlength: 500, Display Size : 20 
				  // Flutter Details: Field Label [Website], Name [website], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.website),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(20), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Website', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 500, Display Size : 20 
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
					onSaved: (value) => setState(() => websiteVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [8] [ Name [Address] : EM Type [TEXT], Java Type [String]  
				  //                  EM size: maxlength: 3, Display Size : 50 
				  // Flutter Details: Field Label [Address], Name [address], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
						keyboardType: TextInputType.multiline,  
							maxLines: 3, 
					//em size: Lines : Size: 3, Columns : Display Size: 50 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.address),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(50), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Address', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 3, Display Size : 50 
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
					onSaved: (value) => setState(() => addressVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [9] [ Name [DateOfInquiry] : EM Type [DATE], Java Type [Calendar]  
				  //                  EM size: maxlength: 10, Display Size : 10 
				  // Flutter Details: Field Label [Dateofinquiry], Name [dateofinquiry], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
				controller: _textEditingController9,  
					//EDT-INIT-VAL    //IS-PICKER  initialValue: getEmStrOpt(foundRecord.dateofinquiry),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(10), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Dateofinquiry', 
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
					onSaved: (value) => setState(() => dateofinquiryVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				    //Date Picker For [dateofinquiry], [DateOfInquiry] 
				    IconButton(	
				        onPressed: () {	
				          _selectDate9(context);	
				        },	
				        icon: Icon(Icons.calendar_today, color: Colors.grey,)	
					 ),	
				    Align(	
				      child: SizedBox(	
				        width: 200,	
				        //height: 50,	
				        child: 	
				       Text("${selectedDate9.day}/${selectedDate9.month}/${selectedDate9.year}"),	
				      ),	
				    ),	
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [10] [ Name [RequestedQty] : EM Type [NUMBER], Java Type [long]  
				  //                  EM size: maxlength: 10, Display Size : 10 
				  // Flutter Details: Field Label [Requestedqty], Name [requestedqty], Type [int]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.requestedqty.toString()),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(10), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Requestedqty', 
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
					onSaved: (value) => setState(() => requestedqtyVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [11] [ Name [ReqQuoteAmt] : EM Type [FLOAT], Java Type [float]  
				  //                  EM size: maxlength: 15, Display Size : 15 
				  // Flutter Details: Field Label [Reqquoteamt], Name [reqquoteamt], Type [double]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.reqquoteamt.toString()),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(15), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Reqquoteamt', 
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
					onSaved: (value) => setState(() => reqquoteamtVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [12] [ Name [MeetingPrefTime] : EM Type [TIME], Java Type [Calendar]  
				  //                  EM size: maxlength: 8, Display Size : 8 
				  // Flutter Details: Field Label [Meetingpreftime], Name [meetingpreftime], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
				controller: _textEditingController12,  
					//EDT-INIT-VAL    //IS-PICKER  initialValue: getEmStrOpt(foundRecord.meetingpreftime),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(8), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Meetingpreftime', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 8, Display Size : 8 
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
					onSaved: (value) => setState(() => meetingpreftimeVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				    //Time Picker For [meetingpreftime], [MeetingPrefTime] 
				    IconButton(	
				        onPressed: () {	
				          _selectTime12(context);	
				        },	
				        icon: Icon(Icons.more_time, color: Colors.grey,)	
					 ),	
				    Align(	
				      child: SizedBox(	
				        width: 200,	
				        //height: 50,	
				        child: 	
				       Text("${selectedTime12.hour}:${selectedTime12.minute}"),	
				      ),	
				    ),	
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [13] [ Name [Created] : EM Type [DATETIME], Java Type [Calendar]  
				  //                  EM size: maxlength: 19, Display Size : 19 
				  // Flutter Details: Field Label [Created], Name [created], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.created),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(19), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Created', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 19, Display Size : 19 
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
					onSaved: (value) => setState(() => createdVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [14] [ Name [Updated] : EM Type [DATETIME], Java Type [Calendar]  
				  //                  EM size: maxlength: 19, Display Size : 19 
				  // Flutter Details: Field Label [Updated], Name [updated], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.updated),   
					  /* 
					  */ 
					  /* 
					  inputFormatters: [ 
						//FilteringTextInputFormatter.digitsOnly,  //For numbers 
						//LengthLimitingTextInputFormatter(19), //for max char limit 
					  ],	 
					  */ 
					decoration: const InputDecoration( 
					  labelText: 'Updated', 
					  border: OutlineInputBorder(), 
						// filled: true, //for limiting size width/height 
					), 
					//em size: maxlength: 19, Display Size : 19 
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
					onSaved: (value) => setState(() => updatedVar = value.toString()), 
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
 
 // [4] Uncomment For Media Upload Customization. Also Uncomment Media Field Assignment in  newErpCustomer creation below  
 /* 
                          //Get Base64 ready 
                          await convertToBytesFile(context); 
 */ 
 
 /* 
                          //Uncomment and Use Model ErpCustomerWoKey from model.dart, when key should not be passed, it is @GeneratedValue on API side  
                          ErpCustomerWoKey newErpCustomer = ErpCustomerWoKey( 
                          //Also Remove Key's TextFormField [1] in Form() method, and Comment Out - Key: Value Assignment below   
 */ 
 
                          // ===== Begin Table-1: Model Assign And Create Service Call 
 
                          ErpCustomer newErpCustomer = ErpCustomer( 
					   customerId: customerIdVar , 
					   name: nameVar , 
					   phone: phoneVar , 
					   mobilePhone: mobilePhoneVar , 
					   // pict: pictVar , 
					   email: emailVar , 
					   website: websiteVar , 
					   address: addressVar , 
					   dateofinquiry: dateofinquiryVar , 
					   requestedqty: getEmIntStrOpt(requestedqtyVar) , 
					   reqquoteamt: getEmDoubleStrOpt(reqquoteamtVar) , 
					   meetingpreftime: meetingpreftimeVar , 
					   created: createdVar , 
					   updated: updatedVar , 
							  ); 
 
                          await ErpCustomerService.ErpCustomerCreate( 
                                  newErpCustomer.toJson()) 
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
                                      builder: (context) =>  const ErpCustomerDataTable(viewType: "ListView"),   
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
 
 
