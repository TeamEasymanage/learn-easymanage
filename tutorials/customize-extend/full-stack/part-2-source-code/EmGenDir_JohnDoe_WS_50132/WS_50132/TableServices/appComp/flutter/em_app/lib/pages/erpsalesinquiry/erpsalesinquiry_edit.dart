import 'package:flutter/material.dart'; 
import 'package:intl/intl.dart';  
 
import 'package:em_app/em_global.dart'; 
import 'package:em_app/pages/erpsalesinquiry/erpsalesinquiry_model.dart'; 
import 'package:em_app/pages/erpsalesinquiry/erpsalesinquiry_service.dart'; 
import 'package:em_app/pages/erpsalesinquiry/erpsalesinquiry_lib.dart'; 
import 'package:em_app/pages/erpsalesinquiry/erpsalesinquiry_data_table.dart'; 
 
 
class ErpSalesInquiryEdit extends StatefulWidget { 
  //need 1st record column and type also 
  final String dateofinquirySelected; 
  const ErpSalesInquiryEdit({Key? key, required this.dateofinquirySelected}) : super(key: key); 
 
  @override 
  _ErpSalesInquiryEditState createState() => _ErpSalesInquiryEditState(); 
} 
 
class _ErpSalesInquiryEditState extends State<ErpSalesInquiryEdit> { 
 
  String errorMsg = timeErrStr; 
 
  bool _loading = false; 	
  bool _isKeySelected = false; 	
  //double fullFormHeight = 700; 	
 	
  //List<String> _dateofinquirys = ["Select A Key Value"]; 	
  String _chosenValue = ""; 	
	
  @override	
  void initState() {	
    super.initState();	
	
    _chosenValue = widget.dateofinquirySelected.toString();	
    _loading = true;	
	
    //Key Value passed, Edit Record Mode 	
		_isKeySelected = true; 	
		_loading = false;	
    /*	
    ErpSalesInquiryService.ErpSalesInquiryViewAllIds().then((ids) { 	
      if (ids is String) {	
        setState(() {	
          errorMsg = ids;	
        });	
      }	
      setState(() { 	
        _dateofinquirys = ids; 	
        _dateofinquirys.insert(0, "Select A Key Value");	
		 //Remove duplicates 	
        _dateofinquirys = _dateofinquirys.toSet().toList();	
        _loading = false;	
      });	
    });	
    */	
  } 	
 	
  @override 	
  Widget build(BuildContext context) { 	
    return Scaffold( 	
	     backgroundColor: Colors.blue.shade200,	
        appBar: AppBar( 	
          title: const Text("ErpSalesInquiry Edit  Form"), 	
          centerTitle: true, 	
        ), 	
        body: _loading 	
            ? EmShowProgress(msg: errorMsg)	
            : SingleChildScrollView(	
                child: Row(	
                  mainAxisAlignment: MainAxisAlignment.center,	
                  children: [	
                    Padding(	
                      padding: const EdgeInsets.only(top: 32.0),	
                      child: Container(	
						 width: emFormFixedWidth, //getEmFormWidth(context),	
                        //width: 600,	
                        //height: _isKeySelected ? fullFormHeight : 150,	
                        // margin: EdgeInsets.only(bottom: _isKeySelected ? 0 : 440),	
                        decoration: const BoxDecoration(	
                            boxShadow: [BoxShadow(color: Colors.white)],	
                            borderRadius:	
                                BorderRadius.all(Radius.circular(10.0))),	
                        child: Column(	
                          children: [	
                            const SizedBox(	
                              height: 10,	
                      ), 	
                      _isKeySelected 	
                          ? FutureBuilder<ErpSalesInquiry>( 	
                              future: ErpSalesInquiryService 	
                                      .ErpSalesInquiryQuery(_chosenValue) 	
                                  .then((value) => value), 	
                              builder: (context, snapshot) { 	
                                switch (snapshot.connectionState) { 	
                                  case ConnectionState.waiting: 	
                                    return const Center( 	
                                        child: CircularProgressIndicator()); 	
                                  default: 	
                                    if (snapshot.hasError) { 	
                                      return const Center( 	
                                          child: Text('Record not found, Select Valid Key Value')); 	
                                    } else { 	
                                      return ErpSalesInquiryEditRec( 	
                                          erpSalesInquiry: snapshot.data!); 	
                                    } 	
                                } 	
                              }) 	
                          : const SizedBox( 	
                              height: 0, 	
                            ) 	
                    ], 	
                  ), 	
                ), 	
               ),	
             ],	
           ),	
        )); 	
  } 	
} 
 
class ErpSalesInquiryEditRec extends StatefulWidget { 
  final ErpSalesInquiry erpSalesInquiry; 
  const ErpSalesInquiryEditRec({Key? key, required this.erpSalesInquiry}) : super(key: key); 
 
  @override 
  _ErpSalesInquiryEditRecState createState() => _ErpSalesInquiryEditRecState(); 
} 
 
class _ErpSalesInquiryEditRecState extends State<ErpSalesInquiryEditRec> { 
  ErpSalesInquiry foundErpSalesInquiry = ErpSalesInquiry(dateofinquiry: "" ); 
 
 
  double emFormHeight  = emFormFixedHeight;  
  double emFormWidth  = emFormFixedWidth;  
 
  static final formKey = GlobalKey<FormState>(); 
		String dateofinquiryVar = ""; 
		String? requestedqtyVar = ""; 
		String? reqquoteamtVar = ""; 
		String? meetingpreftimeVar = ""; 
		String? createdVar = ""; 
		String? updatedVar = ""; 
 
 
	DateTime selectedDate1 = DateTime.now();		
	TextEditingController _textEditingController1 = TextEditingController();	
		
	_selectDate1(BuildContext context) async {		
		final DateTime? selected1 = await showDatePicker(		
		  context: context,		
		  initialDate: selectedDate1,		
		  firstDate: DateTime(1900),		
		  lastDate: DateTime(2100),		
		);		
		
		if (selected1 != null && selected1 != selectedDate1)	{	
		  setState(() {		
			selectedDate1 = selected1;		
			_textEditingController1.text = DateFormat(emDateFmt).format(selectedDate1);		
		  });		
	  	}		
	  }		
 	
	DateTime selectedTime4 = DateTime.now();		
	TextEditingController _textEditingController4 = TextEditingController();	
		
	  _selectTime4(BuildContext context) async {		
		  final TimeOfDay? timeOfDay4 = await showTimePicker(		
			context: context,		
			initialTime: TimeOfDay.fromDateTime(selectedTime4),		
			initialEntryMode: TimePickerEntryMode.dial,		
		  );		
 	
		  if(timeOfDay4 != null)		
			{		
			  setState(() {		
				//Flutter TimePicker only supports hour , minute (No seconds or milliseconds or timezone)	
				final now1 = DateTime.now();	
				selectedTime4 = DateTime(now1.year, now1.month, now1.day, timeOfDay4.hour, timeOfDay4.minute);	
				//selectedTime4.toString();	
				_textEditingController4.text = DateFormat(emTimeFmt).format(selectedTime4);		
				//print(_textEditingController4.text)	;	
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
  void initState() { 
    super.initState(); 
    setState(() { 
      foundErpSalesInquiry = widget.erpSalesInquiry; 
			      _textEditingController1.text = getEmStrOpt(foundErpSalesInquiry.dateofinquiry); 
			      _textEditingController4.text = getEmStrOpt(foundErpSalesInquiry.meetingpreftime); 
    }); 
  } 
 
 
  @override 
  Widget build(BuildContext context) { 
    return SingleChildScrollView( 
 
          child: Container( 
            padding: const EdgeInsets.only(top: 8.0), 
            decoration: const BoxDecoration(boxShadow: [ 
              BoxShadow( 
                color: Colors.white, 
              ), 
            ], borderRadius: BorderRadius.all(Radius.circular(10.0))), 
			  width: emFormWidth, //getEmFormWidth(context), 
	          height: emFormHeight, //MediaQuery.of(context).size.height, 
   	      //width: MediaQuery.of(context).size.width, 
             //width: 600, 
             //height: 620, 
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
				  // Column Details:  Srl No : [1] [ Name [DateOfInquiry] : EM Type [DATE], Java Type [Calendar]  
				  //                  EM size: maxlength: 10, Display Size : 10 
				  // Flutter Details: Field Label [Dateofinquiry], Name [dateofinquiry], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
				controller: _textEditingController1,  
					   enabled: false,  //IS-PICKER  initialValue: getEmStrOpt(foundErpSalesInquiry.dateofinquiry),   
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
					validator: (value) { 
					  if (value!.isEmpty) {  
						return  'Field can not be empty'; }  
					  return null;  
					}, 
					//maxLength: 30, 
					onSaved: (value) => setState(() => dateofinquiryVar = value.toString()), 
				  ), //textformfield 
				), //flexible 
				    //Date Picker For [dateofinquiry], [DateOfInquiry] 
				    IconButton(	
				        onPressed: () {	
				          _selectDate1(context);	
				        },	
				        icon: Icon(Icons.calendar_today, color: Colors.grey,)	
					 ),	
				    Align(	
				      child: SizedBox(	
				        width: 200,	
				        //height: 50,	
				        child: 	
				       Text("${selectedDate1.day}/${selectedDate1.month}/${selectedDate1.year}"),	
				      ),	
				    ),	
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [2] [ Name [RequestedQty] : EM Type [NUMBER], Java Type [long]  
				  //                  EM size: maxlength: 10, Display Size : 10 
				  // Flutter Details: Field Label [Requestedqty], Name [requestedqty], Type [int]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					      initialValue: getEmStrOpt(foundErpSalesInquiry.requestedqty.toString()),   
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
				  // Column Details:  Srl No : [3] [ Name [ReqQuoteAmt] : EM Type [FLOAT], Java Type [float]  
				  //                  EM size: maxlength: 15, Display Size : 15 
				  // Flutter Details: Field Label [Reqquoteamt], Name [reqquoteamt], Type [double]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					      initialValue: getEmStrOpt(foundErpSalesInquiry.reqquoteamt.toString()),   
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
				  // Column Details:  Srl No : [4] [ Name [MeetingPrefTime] : EM Type [TIME], Java Type [Calendar]  
				  //                  EM size: maxlength: 8, Display Size : 8 
				  // Flutter Details: Field Label [Meetingpreftime], Name [meetingpreftime], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
				controller: _textEditingController4,  
					    //IS-PICKER  initialValue: getEmStrOpt(foundErpSalesInquiry.meetingpreftime),   
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
				          _selectTime4(context);	
				        },	
				        icon: Icon(Icons.more_time, color: Colors.grey,)	
					 ),	
				    Align(	
				      child: SizedBox(	
				        width: 200,	
				        //height: 50,	
				        child: 	
				       Text("${selectedTime4.hour}:${selectedTime4.minute}"),	
				      ),	
				    ),	
				]), //Widget[] //Row 
                  const SizedBox(height: 10), 
				  // ---------------------------------------------------------------------------------------  
				  // Column Details:  Srl No : [5] [ Name [Created] : EM Type [DATETIME], Java Type [Calendar]  
				  //                  EM size: maxlength: 19, Display Size : 19 
				  // Flutter Details: Field Label [Created], Name [created], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					      initialValue: getEmStrOpt(foundErpSalesInquiry.created),   
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
				  // Column Details:  Srl No : [6] [ Name [Updated] : EM Type [DATETIME], Java Type [Calendar]  
				  //                  EM size: maxlength: 19, Display Size : 19 
				  // Flutter Details: Field Label [Updated], Name [updated], Type [String]  
				  // ---------------------------------------------------------------------------------------  
				Row( 
				  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
				  children: <Widget>[ 
				Flexible( 
					  child:  
				  TextFormField( 
					      initialValue: getEmStrOpt(foundErpSalesInquiry.updated),   
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
                  const SizedBox(height: 20,), 
                  Builder( 
                    builder: (context) => ButtonWidget( 
                      text: 'Submit', 
                      onClicked: () async { 
                        final isValid = formKey.currentState!.validate(); 
                        // FocusScope.of(context).unfocus(); 
 
                        if (isValid) { 
                          formKey.currentState!.save(); 
 
                          String apiMessage = ""; 
 
						// ========================================================================================================= 
						// ===== BEGIN BLOCK : Calling API Service Calls ('Edit') 1st (optional 2nd...) and Routing to Next Screen 
 
                          // ===== Begin Table-1: Model Assign And Edit Service Call 
 
                          ErpSalesInquiry newErpSalesInquiry = ErpSalesInquiry( 
					   dateofinquiry: dateofinquiryVar , 
					   requestedqty: getEmIntStrOpt(requestedqtyVar) , 
					   reqquoteamt: getEmDoubleStrOpt(reqquoteamtVar) , 
					   meetingpreftime: meetingpreftimeVar , 
					   created: createdVar , 
					   updated: updatedVar , 
							  ); 
 
                          await ErpSalesInquiryService.ErpSalesInquiryEdit( 
                                  newErpSalesInquiry.dateofinquiry, 
                                  newErpSalesInquiry) 
                              .then((message) { 
                                    apiMessage = message; 
                                    message == "Record Updated Successfully" 
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
                                  message == "Record Updated Successfully" 
                                      ? Colors.green 
                                      : Colors.redAccent, 
                            ); 
                            ScaffoldMessenger.of(context) 
                                .showSnackBar(snackBar); 
	 
                          }); 
 
                          // ===== End Table-1: Model Assign And Edit Service Call 
 
                          // ===== Begin Table-2: Model Assign And Edit Service Call 
                          			// If Saving Data to 2 tables is required, Copy/Place those calls here 
 
                          // ===== End Table-2: Model Assign And Edit Service Call 
 
 
                          // ===== Begin: Routing To ListView To Display Data 
                          // ===== Clear Routes As Back buttons leading to previous screens showing old data state are avoided 
                          /* */
                            apiMessage == "Record Updated Successfully" 
                            ?  
                            Navigator.pushAndRemoveUntil(  
                              context,  
                              MaterialPageRoute(   
                                      builder: (context) =>  const ErpSalesInquiryDataTable(viewType: "ListView"),   
                                      				//If Premium: Use parameter to show presently added/edited record 
                                      				//searchClause: " key = 'value' ",  
                                    ),  
                              (Route<dynamic> route) => route.isFirst  
                              ) 
                              : null;  
                          /* */ 
                          // ===== End: Routing To ListView To Display Data 
 
                          // ===== Begin: More Routing Options 
 
								/* To implement RETURN to 1 or 2 Levels BACK -------  
								int popCount = 0;  
                            	apiMessage == "Record Updated Successfully" 
								? 	 
									//Exit 2 levels as data table view not refreshed  
									Navigator.of(context).popUntil((_) => popCount++ >= 2)  
									//Navigator.of(context).pop()   
								: null;  
								*/  
 
                          // ===== End: More Routing Options 
 	
 
						// ===== END BLOCK : Calling API Service Calls ('Edit') 1st (optional 2nd...) and Routing to Next Screen 
						// ========================================================================================================= 
 
                        } //if form valid 
                      },  //onClicked  
                    ), //ButtonWidget 
                  ) //Builder 
                ], 
              ), 
            ), 
          ), 
          ), 
          ), 
          ), 
      ); 
  } 
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
 
 
