import 'package:flutter/material.dart'; 
import 'package:intl/intl.dart';  
 
import 'package:em_app/em_global.dart'; 
import 'package:em_app/pages/erpproduct/erpproduct_data_table.dart'; 
 
 
class ErpProductFilter extends StatefulWidget { 
  const ErpProductFilter({Key? key}) : super(key: key); 
 
  @override 
  _ErpProductFilterState createState() => _ErpProductFilterState(); 
} 
 
class _ErpProductFilterState extends State<ErpProductFilter> { 
 
	double emFormWidthFilter  = 950;  //Use larger width if Column Labels are large width 
	final _scrollController = ScrollController(); 
 
	static final formKey = GlobalKey<FormState>(); 
 
	List<List<String>> tblColumnList = [ 
		["Product Id", 'productId', 'NUMBER'],  
		["Product Name", 'productName', 'CHAR'],  
		["Product Category", 'productCategory', 'CHAR'],  
		["Primary Supplier", 'primarySupplier', 'CHAR'],  
		["Product Desc", 'productDesc', 'TEXT'],  
		//["Product Picture", 'productPicture', 'STREAM'],  
		["Product Added Column", 'productAddedColumn', 'CHAR'],  
	]; 
 
   
    // -------------- searchClause -------------------------- 
   
    // Values Array 
    List<String> filterYN = [ "Yes", "No", "No", "No", "No" ]; 
    List<String> filterAndOr = [ "AND", "AND", "AND", "AND", "AND" ]; 
    List<String> filterColSel = []; 
    List<String> filterOprSel = ["=","=","=","=","="]; 
    List<String> filterColVal = ['', '', '', '', '']; 
 
    //Fixed Lists 
    List<String> filterYNList = ["No", "Yes"]; 
    List<String> filterAndOrList = ["AND", "OR"]; 
    List<List<String>> filterColSelList = [[]]; 
 
/* 
  List<List<String>> NumDtOpr = [ 
    //Numeric Types Long, Float 
    //DateTime Type 
    ['='					,'=' ], 
    ['!='					,'!= (NotEquals)' ], 
    ['>'					,'>' ], 
    ['>='					,'>=' ], 
    ['<'					,'<' ], 
    ['<='					,'<=' ], 
    ['isNull'			,'isNull (Has No Value)' ], 
    ['isNotNull'	,'isNotNull  (Has Value)' ], 
  ]; 
*/ 
 
  List<List<String>> stringOpr = [ 
    //Numeric Types Long, Float 
    //DateTime Type 
    ['='					,'=' ], 
    ['!='					,'!= (NotEquals)' ], 
    ['>'					,'>' ], 
    ['>='					,'>=' ], 
    ['<'					,'<' ], 
    ['<='					,'<=' ], 
    ['isNull'			,'isNull (Has No Value)' ], 
    ['isNotNull'	,'isNotNull  (Has Value)' ], 
 
    //String specific 
    ['like'					,'like' ], 
    ['notLike'				,'notLike' ], 
    ['contains'				,'contains' ], 
 
    //IC 
    ['equalsIgnoreCase'		,'equalsIgnoreCase' ], 
    ['notEqualsIgnoreCase'	,'notEqualsIgnoreCase' ], 
    ['likeIgnoreCase'		,'likeIgnoreCase' ], 
    ['containsIgnoreCase'	,'containsIgnoreCase' ], 
 
  ]; 
 
/* ------------ SIMILAR Operators Suppressed 
// = 
['eq'					,'eq' ], 
['equals'				,'equals' ], 
 
// != 
['ne'					,'ne' ], 
['notEquals'			,'notEquals' ], 
 
['gt'					,'gt' ], 
['goe'					,'goe' ], 
['lt'					,'lt' ], 
['loe'					,'loe' ], 
-------------- */ 
 
 
    //Boolean 
    //Operator =  
    //[Valid filter values : true | false] 
 
/* 
  List<List<String>> BoolOpr = [ 
    //Bool 
    ['='					,'= (Equals)' ], 
    ['isNull'			,'isNull (Has No Value)' ], 
    ['isNotNull'	,'isNotNull  (Has Value)' ], 
  ]; 
*/ 
 
    // -------------- sortBy -------------------------- 
 
    // Values Array 
    List<String> sortYN = [ "No", "No", "No", "No", "No" ]; 
    List<String> sortAscDesc = [ "Asc", "Asc", "Asc", "Asc", "Asc" ]; 
    List<String> sortColSel = []; 
 
    //Fixed Lists 
    List<String> sortYNList = ["No", "Yes"]; 
    List<String> sortAscDescList = ["Asc", "Desc"]; 
 
    // ----------------------------------------------- 
 
  @override  
  void initState() {  
    super.initState();  
      setState(() {  
        var filterColFirst = tblColumnList[0][1]; 
        filterColSel = [ filterColFirst, filterColFirst, filterColFirst, filterColFirst, filterColFirst ]; 
        filterColSelList = tblColumnList; 
        sortColSel = [ filterColFirst, filterColFirst, filterColFirst, filterColFirst, filterColFirst ]; 
      });  
}  
 
  @override  
  Widget build(BuildContext context) {  
	return Scaffold(  
        backgroundColor: Colors.blue.shade200,  
        appBar: AppBar(  
          title: const Text("ErpProduct Filter"),  
          centerTitle: true,  
        ),  
        body: Center( 
          child: Padding( 
            padding: const EdgeInsets.only(top: 8.0), 
            child: Container( 
                padding: const EdgeInsets.only(top: 16.0),  
                decoration: const BoxDecoration(boxShadow: [  
                  BoxShadow(  
                    color: Colors.white,  
                  ),  
                ], borderRadius: BorderRadius.all(Radius.circular(10.0))),  
                height: MediaQuery.of(context).size.height - 100,  
                //width: MediaQuery.of(context).size.width - 50,  
              child: Padding( 
                padding: const EdgeInsets.all(16.0), 
                child: SingleChildScrollView( 
                  child:  
                  Form(  
                  key: formKey,  
                  //autovalidateMode: AutovalidateMode.onUserInteraction,  
 
                  child: Scrollbar( 
                  controller: _scrollController, 
                  child: SingleChildScrollView( 
                    controller: _scrollController, 
                    scrollDirection: Axis.horizontal, 
                      child: Column(   
                        mainAxisAlignment: MainAxisAlignment.start, 
                        mainAxisSize: MainAxisSize.min, 
                      children: [  
                         const Text("Filter By: ", style: TextStyle(fontSize: 18)), 
                        SizedBox( 
                          width: emFormWidthFilter, 
                          child: Flex( 
                            direction: Axis.horizontal, 
                            children: [ 
                              Flexible(  
                            	child: getFilterLine(0) 
                                ), 
                            ], 
                          ), 
                        ), 
                        const SizedBox( 
                              height: 10, 
                         ), 
                        SizedBox( 
                          width: emFormWidthFilter, 
                          child: Flex( 
                            direction: Axis.horizontal, 
                            children: [ 
                              Flexible(  
                            	child: getFilterLine(1) 
                                ), 
                            ], 
                          ), 
                        ), 
                        const SizedBox( 
                              height: 10, 
                         ), 
                        SizedBox( 
                          width: emFormWidthFilter, 
                          child: Flex( 
                            direction: Axis.horizontal, 
                            children: [ 
                              Flexible(  
                            	child: getFilterLine(2) 
                                ), 
                            ], 
                          ), 
                        ), 
                        const SizedBox( 
                              height: 10, 
                         ), 
                        SizedBox( 
                          width: emFormWidthFilter, 
                          child: Flex( 
                            direction: Axis.horizontal, 
                            children: [ 
                              Flexible(  
                            	child: getFilterLine(3) 
                                ), 
                            ], 
                          ), 
                        ), 
                        const SizedBox( 
                              height: 10, 
                         ), 
                        SizedBox( 
                          width: emFormWidthFilter, 
                          child: Flex( 
                            direction: Axis.horizontal, 
                            children: [ 
                              Flexible(  
                            	child: getFilterLine(4) 
                                ), 
                            ], 
                          ), 
                        ), 
                        const SizedBox( 
                              height: 10, 
                         ), 
                         const Text("Sort By: ", style: TextStyle(fontSize: 18)), 
                        SizedBox( 
                          width: emFormWidthFilter, 
                          child: Flex( 
                            direction: Axis.horizontal, 
                            children: [ 
                              Flexible(  
                            	child: getSortLine(0) 
                                ), 
                            ], 
                          ), 
                        ), 
                        const SizedBox( 
                              height: 10, 
                         ), 
                        SizedBox( 
                          width: emFormWidthFilter, 
                          child: Flex( 
                            direction: Axis.horizontal, 
                            children: [ 
                              Flexible(  
                            	child: getSortLine(1) 
                                ), 
                            ], 
                          ), 
                        ), 
                        const SizedBox( 
                              height: 10, 
                         ), 
 
				  // ---------------------------------------------------------------------------------------   
				  // ---------------------------------------------------------------------------------------   
 
                        Builder(  
                          builder: (context) => ButtonWidget(  
                            text: 'Search',  
 
                            onClicked: () // async  
                            	 {  
                              final isValid = formKey.currentState!.validate();  
                              // FocusScope.of(context).unfocus();  
 
                              if (isValid) {  
                                formKey.currentState!.save();  
 
                                //Calling the Search Class  
 
    // ------------------ searchBy ------------------------------------- 
    String selectString = ""; 
 
 
    for (var i=0;i<5;i++) { 
                      String dtType = ""; 
                      for(var e in filterColSelList) { 
                          e[1] == filterColSel[i] ? dtType = e[2] : null;  
 
                      }  
                      //print("Line ("+i.toString()+") Selections: ["+dtType+"] ["+filterYN[i]+"|"+filterAndOr[i]+"|"+filterColSel[i]+"|"+filterOprSel[i]+"|"+filterColVal[i]+"]"); 
                      //selectString =  
                      //+filterColSel[i]+"|"+filterOprSel[i]+"|"+filterColVal[i]+ 
                      String strQuote = "'"; 
                      if (dtType == 'NUMBER' || dtType == 'FLOAT' || dtType == 'MONEY' ) { 
                      strQuote = ""; 
 
                      } 
 
                      //Full 
                      //selectString = selectString +" "+filterAndOr[i]+" "+filterColSel[i]+" "+filterOprSel[i]+" "+strQuote+filterColVal[i]+strQuote+" "; 
 
                      if(filterYN[i] == "Yes") { 
 
                      //AndOr 
                      if (i > 0) { 
                      selectString = selectString + " "+filterAndOr[i]; 
                      } 
 
                      //FilterCol 
                      selectString = selectString + " "+filterColSel[i]; 
 
                      //FilterOpr 
                      selectString = selectString + " "+filterOprSel[i]; 
 
                      //FilterVal 
                      if (filterOprSel[i] == 'isNull' || filterOprSel[i] == 'isNotNull'  ) { 
                      		if (dtType == 'NUMBER' || dtType == 'FLOAT' || dtType == 'MONEY' ) { 
                      			selectString = selectString +" 0 "; 
                      		} else { 
                      			selectString = selectString +" '' "; 
                      		} 
                      } else { 
                      selectString = selectString +" "+strQuote+filterColVal[i]+strQuote+" "; 
 
                      } 
 
                      } 
 
 
    } 
                      //print("Select String :[" +selectString +"]"); 
    // ------------------ searchBy ------------------------------------- 
 
    // ------------------ sortBy ------------------------------------- 
    String sortString = ""; 
 
 
    for (var i=0;i<5;i++) { 
 
                      if(sortYN[i] == "Yes") { 
                      //col 
                      sortString = sortString + " "+sortColSel[i]; 
 
                      //direction 
                      sortString = sortString + " "+sortAscDesc[i]; 
                      } 
 
    } 
                      //print("SortBy String :[" +sortString +"]"); 
    // ------------------ sortBy ------------------------------------- 
 
    /* 
    //Custom Filter screen example usage 
     if (productIdVar.isEmpty) {  
      productIdVar = '%'; 
    } else { 
      productIdVar = '%'+productIdVar+'%'; 
    } 
     if (priceMinVar!.isEmpty) {  
      priceMinVar = '0'; 
    } 
     if (priceMaxVar!.isEmpty) {  
      priceMaxVar = '1000000000'; 
    } 
    */ 
 
                                          // ------------ Call Display Data Class with Parameters  
                                           Navigator.of(context).push(MaterialPageRoute( 	  
                                            builder: (context) =>   
                                            ErpProductDataTable(viewType: "ListView", 
                                            pageNo: 0, 
                                            searchClause: selectString, 
                                            sortClause: sortString, 
                                            ) 
                                            ), 	  
                                          ); 	  
 	 
                              }  
                            },  
                          ),  
                        )  
                      ],  
                      ), 
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
 
Widget getFilterLine(int lineNo) { 
                        return      Row( 
                                children: [ 
                                  Text("["+(lineNo+1).toString()+"]"), 
                                  const SizedBox( 
                                    width: 8, 
                                  ), 
                                  DropdownButton( 
                                    // Initial Value 
                                    value: filterYN[lineNo],  
                                    focusColor: Colors.blueGrey, 
 
                                    // Down Arrow Icon 
                                    //icon: const Icon(Icons.expand_more_outlined), 
 
                                    // Array list of options 
                                    items: filterYNList.map((e) { 
                                      //print("opr "+e[0]+",  val "+e[1]); 
                                      return DropdownMenuItem( 
                                        value: e, 
                                        child: Text( 
                                          e == "Yes" ? "\u{2714}" : "\u{2716}" 
                                          //e, 
                                        //style: const TextStyle(backgroundColor: Colors.blue),  
                                        ), 
                                      ); 
                                    }).toList(), 
                                    onChanged:  
                                    lineNo == 0 ? null : 
                                    (String? newValue) { 
                                      setState(() { 
                                        filterYN[lineNo] = newValue!; 
                                      }); 
                                    }, 
                                  ), 
                                  const SizedBox( 
                                    width: 8, 
                                  ), 
                                  DropdownButton( 
                                    // Initial Value 
                                    value: filterAndOr[lineNo],  
                                    focusColor: Colors.blueGrey, 
 
                                    // Down Arrow Icon 
                                    //icon: const Icon(Icons.expand_more_outlined), 
 
                                    // Array list of options 
                                    items: filterAndOrList.map((e) { 
                                      //print("opr "+e[0]+",  val "+e[1]); 
                                      return DropdownMenuItem( 
                                        value: e, 
                                        child: Text( 
                                          e, 
                                        //style: const TextStyle(backgroundColor: Colors.blue),  
                                        ), 
                                      ); 
                                    }).toList(), 
                                    onChanged:  
                                    lineNo == 0 ? null : 
                                    (String? newValue) { 
                                      setState(() { 
                                        filterAndOr[lineNo] = newValue!; 
                                      }); 
                                    }, 
                                  ), 
                                  const SizedBox( 
                                    width: 8, 
                                  ), 
                                  DropdownButton( 
                                    // Initial Value 
                                    value: filterColSel[lineNo],  
                                    focusColor: Colors.blueGrey, 
 
                                    // Down Arrow Icon 
                                    //icon: const Icon(Icons.keyboard_arrow_down), 
 
                                    // Array list of options 
                                    items: filterColSelList.map((e) { 
                                      //print("opr "+e[0]+",  val "+e[1]); 
                                      return DropdownMenuItem( 
                                        value: e[1], 
                                        child: Text(e[0] +" ["+e[2]+"]", 
                                        //style: const TextStyle(backgroundColor: Colors.blue),  
                                        ), 
                                      ); 
                                    }).toList(), 
                                    onChanged: (String? newValue) { 
                                      setState(() { 
                                        filterColSel[lineNo] = newValue!; 
                                      }); 
                                    }, 
                                  ), 
                                  const SizedBox( 
                                    width: 8, 
                                  ), 
                                  Flexible( 
                                    child: DropdownButtonFormField( 
                                      // Initial Value 
                                      value: filterOprSel[lineNo],  
                                      focusColor: Colors.blueGrey, 
 
                                      // Down Arrow Icon 
                                      //icon: const Icon(Icons.keyboard_arrow_down), 
 
                                      // Array list of options 
                                      items: stringOpr.map((e) { 
                                        //print("opr "+e[0]+",  val "+e[1]); 
                                        return DropdownMenuItem( 
                                          value: e[0], 
                                          child: Text(e[1], 
                                          //style: const TextStyle(backgroundColor: Colors.blue),  
                                          ), 
                                        ); 
                                      }).toList(), 
                                      //validator: (value) => value == null ? 'field required' : null, 
                                      validator: (value) {  
 
                                        String dtType = ""; 
                                        for(var e in filterColSelList) { 
                                                    e[1] == filterColSel[lineNo] ? dtType = e[2] : null;  
 
                                        }  
                                        //print("dtType | Opr "+dtType+" "+value.toString()); 
 
                                        if (doValidateDtAndOpr(dtType, value.toString())) {   
                                        return  'Operator Not Supported For Column Data Type';  
                                        }   
                                        //return null;   
                                      },  
                                      onChanged: (String? newValue) { 
                                        setState(() { 
                                          filterOprSel[lineNo] = newValue!; 
                                        }); 
                                      }, 
                                    ), 
                                  ), 
                                  const SizedBox( 
                                    width: 8, 
                                  ), 
				Flexible( 
				  child: TextFormField(  
				  	//EDT-INIT-VAL      initialValue: getEmStrOpt(foundRecord.productType),    
				  	  /*  
				  	  */  
				  	  /*  
				  	  inputFormatters: [  
				  		//FilteringTextInputFormatter.digitsOnly,  //For numbers  
				  		//LengthLimitingTextInputFormatter(20), //for max char limit  
				  	  ],	  
				  	  */  
				  	decoration: const InputDecoration(  
				  	  labelText: 'Filter Value',  
				  	  border: OutlineInputBorder(),  
				  		// filled: true, //for limiting size width/height  
				  	),  
				  	//em size: maxlength: 30, Display Size : 20  
				  	//for display width , adjust parent available space   
				  	validator: (value) {  
 
            if (filterYN[lineNo] == 'Yes') { 
            if (filterOprSel[lineNo] != 'isNull' && filterOprSel[lineNo] != 'isNotNull'  ) { 
				  	  if (value!.isEmpty) {   
				  		return  'Field can not be empty';  
            }   
 
            String dtType = ""; 
            for(var e in filterColSelList) { 
                        e[1] == filterColSel[lineNo] ? dtType = e[2] : null;  
 
            }  
            //print("dtType | Opr "+dtType+" "+value.toString()); 
 
            if (dtType == 'NUMBER' || dtType == 'FLOAT' || dtType == 'MONEY' ) {   
				  	  if (!_isNumeric(value)) {  
				  		return ' | Enter a valid Numeric value';  
            }  
            } 
             
            if (dtType == 'BOOLEAN' ) {   
				  	  if (filterOprSel[lineNo] == '=' ) {  
				  	  if (value == 'true' || value == 'false' ) {  
            } else { 
				  		return ' | Enter value as true or false only.';  
            }  
            } 
            } 
            } 
            } 
				  	  //return null;   
				  	},  
				  	//maxLength: 30,  
				  	onSaved: (value) => setState(() => filterColVal[lineNo] = value.toString()),  
				  ), 
				), 
      ], 
    ); 
 
} 
 
bool doValidateDtAndOpr(String dtType, String opr) {   
 
    //check Operator not supported for data type , and return true 
    //1] String 
    if ( 
      opr == 'like' || 
      opr == 'notLike' || 
      opr == 'contains' || 
      opr == 'equalsIgnoreCase' || 
      opr == 'notEqualsIgnoreCase' || 
      opr == 'likeIgnoreCase' || 
      opr == 'containsIgnoreCase'  
    ) { 
    if (dtType == 'CHAR' || dtType == 'TEXT' || dtType == 'TEXTS' || dtType == 'HYPERLINK') { 
      return false; 
    } else { 
      return true; 
    } 
    } 
    //2] Boolean 
    if (dtType == 'BOOLEAN') { 
    if ( 
      opr == '=' || 
      opr == 'isNull' || 
      opr == 'isNotNull' 
    ) { 
      return false; 
    } else { 
      return true; 
    } 
    } 
    //3] String unSupported 
    if (dtType == 'CHAR' || dtType == 'TEXT' || dtType == 'TEXTS' || dtType == 'HYPERLINK') { 
    if ( 
      opr == '<=' || 
      opr == '>=' 
    ) { 
      return true; 
    } else { 
      return false; 
    } 
    } 
 
    return false; 
 
} 
 
Widget getSortLine(int lineNo) { 
                        return      Row( 
                                children: [ 
                                  Text("("+(lineNo+1).toString()+")"), 
                                  const SizedBox( 
                                    width: 8, 
                                  ), 
                                  DropdownButton( 
                                    // Initial Value 
                                    value: sortYN[lineNo],  
                                    focusColor: Colors.blueGrey, 
 
                                    // Down Arrow Icon 
                                    //icon: const Icon(Icons.expand_more_outlined), 
 
                                    // Array list of options 
                                    items: sortYNList.map((e) { 
                                      //print("opr "+e[0]+",  val "+e[1]); 
                                      return DropdownMenuItem( 
                                        value: e, 
                                        child: Text( 
                                          e == "Yes" ? "\u{2714}" : "\u{2716}" 
                                          //e, 
                                        //style: const TextStyle(backgroundColor: Colors.blue),  
                                        ), 
                                      ); 
                                    }).toList(), 
                                    onChanged:  
                                    //lineNo == 0 ? null : 
                                    (String? newValue) { 
                                      setState(() { 
                                        sortYN[lineNo] = newValue!; 
                                      }); 
                                    }, 
                                  ), 
                                  const SizedBox( 
                                    width: 8, 
                                  ), 
                                  DropdownButton( 
                                    // Initial Value 
                                    value: sortColSel[lineNo],  
                                    focusColor: Colors.blueGrey, 
 
                                    // Down Arrow Icon 
                                    //icon: const Icon(Icons.keyboard_arrow_down), 
 
                                    // Array list of options 
                                    items: filterColSelList.map((e) { 
                                      //print("opr "+e[0]+",  val "+e[1]); 
                                      return DropdownMenuItem( 
                                        value: e[1], 
                                        child: Text(e[0] +" ["+e[2]+"]", 
                                        //style: const TextStyle(backgroundColor: Colors.blue),  
                                        ), 
                                      ); 
                                    }).toList(), 
                                    onChanged: (String? newValue) { 
                                      setState(() { 
                                        sortColSel[lineNo] = newValue!; 
                                      }); 
                                    }, 
                                  ), 
                                  const SizedBox( 
                                    width: 8, 
                                  ), 
                                  DropdownButton( 
                                    // Initial Value 
                                    value: sortAscDesc[lineNo],  
                                    focusColor: Colors.blueGrey, 
 
                                    // Down Arrow Icon 
                                    //icon: const Icon(Icons.expand_more_outlined), 
 
                                    // Array list of options 
                                    items: sortAscDescList.map((e) { 
                                      //print("opr "+e[0]+",  val "+e[1]); 
                                      return DropdownMenuItem( 
                                        value: e, 
                                        child: Text(e, 
                                          //e, 
                                        //style: const TextStyle(backgroundColor: Colors.blue),  
                                        ), 
                                      ); 
                                    }).toList(), 
                                    onChanged:  
                                    //lineNo == 0 ? null : 
                                    (String? newValue) { 
                                      setState(() { 
                                        sortAscDesc[lineNo] = newValue!; 
                                      }); 
                                    }, 
                                  ), 
                                ], 
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
 
 
