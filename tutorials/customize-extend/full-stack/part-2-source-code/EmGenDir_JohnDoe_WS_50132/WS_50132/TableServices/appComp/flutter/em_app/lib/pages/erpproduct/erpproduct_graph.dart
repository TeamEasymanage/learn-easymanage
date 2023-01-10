import 'dart:convert'; 
import 'package:fl_chart/fl_chart.dart'; 
import 'package:flutter/material.dart'; 
 
import 'package:em_app/em_global.dart'; 
import 'package:em_app/pages/erpproduct/erpproduct_model.dart'; 
import 'package:em_app/pages/erpproduct/erpproduct_service.dart'; 
 
/* Static graph data : model and sample data */ 	
class EmChartModel { 	
  EmChartModel({ 	
    required this.year, 	
    this.month, 	
    this.totalQty, 	
  }); 	
 	
  int year; 	
  double? month; 	
  double? totalQty; 	
 	
  factory EmChartModel.fromJson(Map<String, dynamic> json) => EmChartModel( 	
        year: json["year"], 	
        month: 0.0 + json["month"], 	
        totalQty: 0.0 + json["totalQty"], 	
      ); 	
} 	
 	
class ErpProductGraph extends StatefulWidget { 	
  const ErpProductGraph({Key? key}) : super(key: key); 	
	 	
  @override 	
  _ErpProductGraphState createState() => _ErpProductGraphState(); 	
} 	
	 	
class _ErpProductGraphState extends State<ErpProductGraph> { 	
 	
  //List<ErpProduct> erpProductList = []; 	
  List<EmChartModel> erpProductList = []; 	
  String dataJson = 	
      "[{\"year\":2020, \"month\":2, \"totalQty\":4},{\"year\":2021, \"month\":3, \"totalQty\":7},{\"year\":2022, \"month\":5, \"totalQty\":9}  ]";	
 	
  bool _loading = true; 	
  final List<String> _chartOpt = ['BarChart', 'LineChart']; 	
  String _chartOptSel = 'BarChart'; 	
 	
  @override 	
  void initState() { 	
    super.initState(); 	
    //ErpProductService.ErpProductViewAll().then((getList) { 	
    setState(() { 	
      //erpProductList = getList; 	
      //Local static data loading 	
      erpProductList = (json.decode(dataJson) as List) 	
          .map((data) => EmChartModel.fromJson(data)) 	
          .toList(); 	
      //Implement some sorting logic for the Sum data 	
      _loading = false; 	
    }); 	
    //}); 	
  } 	
 	
  @override 	
  Widget build(BuildContext context) { 	
    return Scaffold( 	
      appBar: AppBar( 	
        title: Text(_loading ? 'Loading...' : 'ErpProduct Graph'), 	
        centerTitle: true, 	
      ), 	
      body: _loading 	
          ? const CircularProgressIndicator() 	
          : Container( 	
              child: Column( 	
                children: [ 	
                  Center( 	
                    child: Column(children: [ 	
                      Padding( 	
                        padding: const EdgeInsets.only(top: 44), 	
                        child: SingleChildScrollView( 	
                         scrollDirection: Axis.horizontal,	
                         child: SingleChildScrollView( 	
                          child: Row( 	
                            mainAxisAlignment: MainAxisAlignment.center, 	
                            children: [ 	
                              const Text( 	
                                "Graph: ", 	
                              ), 	
                              const SizedBox( 	
                                width: 24, 	
                              ), 	
                              DropdownButton<String>( 	
                                borderRadius: BorderRadius.circular(5), 	
                                dropdownColor: Colors.white, 	
                                value: _chartOptSel, 	
                                style: const TextStyle( 	
                                    //fontSize: 18, 	
                                    //fontWeight: FontWeight.w400, 	
                                    color: Colors.black), 	
                                items: _chartOpt 	
                                    .map((e) => DropdownMenuItem( 	
                                          child: Text(e), 	
                                          value: e, 	
                                        )) 	
                                    .toList(), 	
                                hint: const Text( 	
                                  "Please select an option", 	
                                ), 	
                                onChanged: (value) { 	
                                  setState(() { 	
                                    _chartOptSel = value!; 	
                                    /* 	
                                    if (value == 'BarChart') { 	
                                      _showBarChart = true; 	
                                    } else { 	
                                      _showBarChart = false; 	
                                    } 	
                                    */ 	
                                  }); 	
                                }, 	
                              ), 	
                              Text( 	
                                  "(Based on Static data, Edit Flutter Code to feed live data.)"), 	
                            ], 	
                          ), 	
                        ), 	
                       ), 	
                      ), 	
                      const SizedBox( 	
                        height: 20, 	
                      ) 	
                    ]), 	
                  ), 	
                  Center( 	
                    child: Container( 	
                      height: MediaQuery.of(context).size.height - 200, 	
                      width: MediaQuery.of(context).size.width * 98/100, 	
                      decoration: const BoxDecoration( 	
                          borderRadius: BorderRadius.all( 	
                            Radius.circular(18), 	
                          ), 	
                          color: Color(0xff232d37)), 	
                      child: Padding( 	
                        padding: const EdgeInsets.only( 	
                            right: 24.0, left: 18.0, top: 44, bottom: 8), 	
                        child: (_chartOptSel == 'BarChart') 	
                            ? BarChartSample2( 	
                                erpProductList: erpProductList) 	
                            : LineChart(lineChartErpProduct()), 	
                      ), 	
                    ), 	
                  ), 	
                ], 	
              ), 	
            ), 	
    ); 	
  } 	
 	
  LineChartData lineChartErpProduct() { 	
    List<Color> gradientColors = [ 	
      const Color(0xff23b6e6), 	
      const Color(0xff02d39a), 	
    ]; 	
 	
    double minXv = 2019; 	
    double maxXv = 2022; 	
    double minYv = 1; 	
    double maxYv = 6; 	
 	
    return LineChartData( 	
      gridData: FlGridData( 	
        show: true, 	
        drawVerticalLine: true, 	
        getDrawingHorizontalLine: (value) { 	
          return FlLine( 	
            color: const Color(0xff37434d), 	
            strokeWidth: 1, 	
          ); 	
        }, 	
        getDrawingVerticalLine: (value) { 	
          return FlLine( 	
            color: const Color(0xff37434d), 	
            strokeWidth: 1, 	
          ); 	
        }, 	
      ), 	
      titlesData: FlTitlesData( 	
        show: true, 	
        rightTitles: SideTitles(showTitles: false), 	
        topTitles: SideTitles(showTitles: false), 	
        bottomTitles: SideTitles( 	
          showTitles: true, 	
          reservedSize: 22, 	
          interval: 1, 	
          getTextStyles: (context, value) => const TextStyle( 	
              color: Color(0xff68737d), 	
              fontWeight: FontWeight.bold, 	
              fontSize: 16), 	
          getTitles: (value) { 	
            return value.toString(); 	
          }, 	
          margin: 8, 	
        ), 	
        leftTitles: SideTitles( 	
          showTitles: true, 	
          interval: 1, 	
          getTextStyles: (context, value) => const TextStyle( 	
            color: Color(0xff67727d), 	
            fontWeight: FontWeight.bold, 	
            fontSize: 15, 	
          ), 	
          getTitles: (value) { 	
            return value.toString(); 	
          }, 	
          reservedSize: 40, 	
          margin: 12, 	
        ), 	
      ), 	
      borderData: FlBorderData( 	
          show: true, 	
          border: Border.all(color: const Color(0xff37434d), width: 1)), 	
      minX: minXv, 	
      maxX: maxXv, 	
      minY: minYv, 	
      maxY: maxYv, 	
      lineBarsData: [ 	
        LineChartBarData( 	
          spots: erpProductList 	
              //.sublist(0, 10) 	
              .map((e) => FlSpot((e.year.toDouble()), e.month!.toDouble())) 	
              .toList(), 	
          isCurved: true, 	
          colors: gradientColors, 	
          barWidth: 7.5, 	
          isStrokeCapRound: true, 	
          dotData: FlDotData( 	
            show: false, 	
          ), 	
          belowBarData: BarAreaData( 	
            show: true, 	
            colors: 	
                gradientColors.map((color) => color.withOpacity(0.2)).toList(), 	
          ), 	
        ), 	
      ], 	
    ); 	
  } 	
} 	
 	
class BarChartSample2 extends StatefulWidget { 	
  final List<EmChartModel> erpProductList; 	
  const BarChartSample2({Key? key, required this.erpProductList}) 	
      : super(key: key); 	
 	
  @override 	
  State<StatefulWidget> createState() => BarChartSample2State(); 	
} 	
 	
class BarChartSample2State extends State<BarChartSample2> { 	
  final Color leftBarColor = const Color(0xff53fdd7); 	
  final Color rightBarColor = const Color(0xffff5182); 	
  final double width = 7; 	
 	
  late List<BarChartGroupData> rawBarGroups; 	
  late List<BarChartGroupData> showingBarGroups; 	
 	
  //int touchedGroupIndex = -1; 	
  double maxYvb = 10; 	
 	
  @override 	
  void initState() { 	
    super.initState(); 	
 	
    rawBarGroups = widget.erpProductList 	
        //.sublist(0, 10) 	
        .map((e) => makeGroupData( 	
            (e.year), e.month!.toDouble(), e.totalQty!.toDouble())) 	
        .toList(); 	
 	
    showingBarGroups = rawBarGroups; 	
 	
/* 	
    final barGroup1 = makeGroupData(0, 5, 12); 	
    final barGroup2 = makeGroupData(1, 16, 12); 	
    final barGroup3 = makeGroupData(2, 18, 5); 	
 	
    final items = [ 	
      barGroup1, 	
      barGroup2, 	
      barGroup3, 	
    ]; 	
    rawBarGroups = items; 	
    showingBarGroups = rawBarGroups; 	
*/ 	
  } 	
 	
  @override 	
  Widget build(BuildContext context) { 	
    return AspectRatio( 	
      aspectRatio: 1, 	
      child: Card( 	
        elevation: 0, 	
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), 	
        color: const Color(0xff2c4260), 	
        child: Padding( 	
          padding: const EdgeInsets.all(16), 	
          child: Column( 	
            crossAxisAlignment: CrossAxisAlignment.stretch, 	
            mainAxisAlignment: MainAxisAlignment.start, 	
            mainAxisSize: MainAxisSize.max, 	
            children: <Widget>[ 	
              Row( 	
                crossAxisAlignment: CrossAxisAlignment.center, 	
                mainAxisSize: MainAxisSize.min, 	
                mainAxisAlignment: MainAxisAlignment.start, 	
                children: <Widget>[ 	
                  makeTransactionsIcon(), 	
                  const SizedBox( 	
                    width: 38, 	
                  ), 	
                  const Text( 	
                    'ErpProduct', 	
                    style: TextStyle(color: Colors.white, fontSize: 22), 	
                  ), 	
                  const SizedBox( 	
                    width: 4, 	
                  ), 	
                  const Text( 	
                    'BarChart', 	
                    style: TextStyle(color: Color(0xff77839a), fontSize: 16), 	
                  ), 	
                ], 	
              ), 	
              const SizedBox( 	
                height: 38, 	
              ), 	
              Expanded( 	
                child: BarChart( 	
                  BarChartData( 	
                    maxY: maxYvb, 	
                    //barTouchData: BarTouchData(), 	
                    titlesData: FlTitlesData( 	
                      show: true, 	
                      rightTitles: SideTitles(showTitles: false), 	
                      topTitles: SideTitles(showTitles: false), 	
                      bottomTitles: SideTitles( 	
                        showTitles: true, 	
                        getTextStyles: (context, value) => const TextStyle( 	
                            color: Color(0xff7589a2), 	
                            fontWeight: FontWeight.bold, 	
                            fontSize: 14), 	
                        margin: 20, 	
                        getTitles: (double value) { 	
                          return value.toString(); 	
                        }, 	
                      ), 	
                      leftTitles: SideTitles( 	
                        showTitles: true, 	
                        getTextStyles: (context, value) => const TextStyle( 	
                            color: Color(0xff7589a2), 	
                            fontWeight: FontWeight.bold, 	
                            fontSize: 14), 	
                        margin: 8, 	
                        reservedSize: 28, 	
                        interval: 1, 	
                        getTitles: (value) { 	
                          return value.toString(); 	
                        }, 	
                      ), 	
                    ), 	
                    borderData: FlBorderData( 	
                      show: false, 	
                    ), 	
                    barGroups: showingBarGroups, 	
                    gridData: FlGridData(show: false), 	
                  ), 	
                ), 	
              ), 	
              const SizedBox( 	
                height: 12, 	
              ), 	
            ], 	
          ), 	
        ), 	
      ), 	
    ); 	
  } 	
 	
  BarChartGroupData makeGroupData(int x, double y1, double y2) { 	
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [ 	
      BarChartRodData( 	
        y: y1, 	
        colors: [leftBarColor], 	
        width: width, 	
      ), 	
      BarChartRodData( 	
        y: y2, 	
        colors: [rightBarColor], 	
        width: width, 	
      ), 	
    ]); 	
  } 	
 	
  Widget makeTransactionsIcon() { 	
    const width = 4.5; 	
    const space = 3.5; 	
    return Row( 	
      mainAxisSize: MainAxisSize.min, 	
      crossAxisAlignment: CrossAxisAlignment.center, 	
      children: <Widget>[ 	
        Container( 	
          width: width, 	
          height: 10, 	
          color: Colors.white.withOpacity(0.4), 	
        ), 	
        const SizedBox( 	
          width: space, 	
        ), 	
        Container( 	
          width: width, 	
          height: 28, 	
          color: Colors.white.withOpacity(0.8), 	
        ), 	
        const SizedBox( 	
          width: space, 	
        ), 	
        Container( 	
          width: width, 	
          height: 42, 	
          color: Colors.white.withOpacity(1), 	
        ), 	
        const SizedBox( 	
          width: space, 	
        ), 	
        Container( 	
          width: width, 	
          height: 28, 	
          color: Colors.white.withOpacity(0.8), 	
        ), 	
        const SizedBox( 	
          width: space, 	
        ), 	
        Container( 	
          width: width, 	
          height: 10, 	
          color: Colors.white.withOpacity(0.4), 	
        ), 	
      ], 	
    ); 	
  } 	
} 	
 
